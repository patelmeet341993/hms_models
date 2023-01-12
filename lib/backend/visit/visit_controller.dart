import 'package:hms_models/backend/admin_user/admin_user_controller.dart';
import 'package:hms_models/configs/error_codes_and_messages.dart';
import 'package:hms_models/models/common/app_error_model.dart';
import 'package:hms_models/models/common/data_response_model.dart';

import '../../hms_models.dart';

class VisitController {
  late VisitRepository visitRepository;

  VisitController({VisitRepository? repository}) {
    visitRepository = repository ?? VisitRepository();
  }

  Future<VisitModel?> getVisitModelFromVisitId({required String visitId}) async {
    return visitRepository.getVisitModelFromVisitId(visitId: visitId);
  }

  Future<DataResponseModel<VisitModel>> createNewVisit({
    required String doctorId,
    required String doctorName,
    required String hospitalId,
    required String patientId,
    String description = "",
    double weight = 0,
    bool waitForOtherOperations = false,
  }) async {
    MyPrint.printOnConsole("VisitController().createNewVisit() called");

    //region Validate Required Parameters
    if(doctorId.isEmpty || hospitalId.isEmpty || patientId.isEmpty) {
      return DataResponseModel(
        appErrorModel: AppErrorModel(
          code: AppErrorCodes.requiredInformationAreMissing,
          message: AppErrorMessages.requiredInformationAreMissing,
        ),
      );
    }
    //endregion

    DataResponseModel<VisitModel> dataResponseModel;

    try {
      //region Get PatientData and Validate
      PatientModel? patientModel = await PatientController().getPatientModelFromPatientId(patientId: patientId);

      if(patientModel == null) {
        return DataResponseModel(
          appErrorModel: AppErrorModel(
            code: AppErrorCodes.patientNotFound,
            message: AppErrorMessages.patientNotFound,
          ),
        );
      }
      //endregion

      //region Check if Patient is Having any Active Visit For Same Hospital or Not
      //If he is having, cannot create new visit
      if(patientModel.activeVisits.isNotEmpty) {
        Map<String, VisitModel> visits = await visitRepository.getVisitModelsFromVisitIds(visitIds: patientModel.activeVisits.keys.toList());

        bool isHavingActiveVisitForSameHospital = false;

        for(VisitModel visitModel in visits.values) {
          MyPrint.printOnConsole("visit id:${visitModel.id}, hospitalId:${visitModel.hospitalId}");
          if(visitModel.hospitalId == hospitalId) {
            isHavingActiveVisitForSameHospital = true;
            break;
          }
        }

        if(isHavingActiveVisitForSameHospital) {
          return DataResponseModel(
            appErrorModel: AppErrorModel(
              code: AppErrorCodes.alreadyHavingActiveVisitInSameHospitalCannotCreateNewVisit,
              message: AppErrorMessages.alreadyHavingActiveVisitInSameHospitalCannotCreateNewVisit,
            ),
          );
        }
      }
      //endregion

      NewDocumentDataModel newDocumentDataModel = await MyUtils.getNewDocIdAndTimeStamp();

      //region Create New Visit Model by Filling Data
      VisitModel visitModel = VisitModel(
        id: newDocumentDataModel.docId,
        patientId: patientModel.id,
        patientName: patientModel.name,
        description: description,
        hospitalId: hospitalId,
        currentDoctorId: doctorId,
        currentDoctorName: doctorName,
        doctors: {
          AdminUserType.reception : doctorId,
        },
        createdTime: newDocumentDataModel.timestamp,
        weight: weight,
        active: true,
        patientModel: patientModel,
        isTreatmentActiveStream: true,
        treatmentActivity: [
          TreatmentActivityModel(
            treatmentActivityStatus: TreatmentActivityStatus.assigned,
            createdTime: newDocumentDataModel.timestamp,
          ),
        ],
        treatmentActivityDetailedLog: [
          TreatmentActivityModel(
            treatmentActivityStatus: TreatmentActivityStatus.assigned,
            createdTime: newDocumentDataModel.timestamp,
          ),
        ],
      );
      //endregion

      await FirebaseNodes.visitDocumentReference(visitId: visitModel.id).set(visitModel.toMap(),);

      //region Perform Other Operations Related to Visit Creation
      List<Future> futures = [
        PatientController().addVisitIdInActiveVisits(patientId: patientModel.id, visitId: visitModel.id),
        AdminUserController().addVisitIdInPatientsQueue(doctorId: doctorId, visitId: visitModel.id),
      ];

      if(waitForOtherOperations) await Future.wait(futures);
      //endregion

      dataResponseModel = DataResponseModel<VisitModel>(data: visitModel,);
    }
    catch(e, s) {
      MyPrint.printOnConsole("Error in VisitController().createNewVisit():$e");
      MyPrint.logOnConsole(s);

      dataResponseModel = DataResponseModel<VisitModel>(
        appErrorModel: AppErrorModel(
          code: AppErrorCodes.someErrorOccurredWhileCreatingVisit,
          message: AppErrorMessages.someErrorOccurredWhileCreatingVisit,
          exception: e,
          stackTrace: s,
        ),
      );
    }

    return dataResponseModel;
  }


}