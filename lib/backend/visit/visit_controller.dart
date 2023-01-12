import 'package:hms_models/backend/admin_user/admin_user_controller.dart';

import '../../hms_models.dart';

class VisitController {
  late VisitRepository visitRepository;

  VisitController({VisitRepository? repository}) {
    visitRepository = repository ?? VisitRepository();
  }

  Future<VisitModel?> createNewVisit({
    String doctorId = "",
    String doctorName = "",
    String hospitalId = "",
    required PatientModel patientModel,
    String description = "",
    double weight = 0,
  }) async {
    MyPrint.printOnConsole("VisitController().createNewVisit() called");

    try {
      NewDocumentDataModel newDocumentDataModel = await MyUtils.getNewDocIdAndTimeStamp();

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
        patientModel: PatientModel(
          id: patientModel.id,
          name: patientModel.name,
          gender: patientModel.gender,
          bloodGroup: patientModel.bloodGroup,
          dateOfBirth: patientModel.dateOfBirth,
          userMobiles: [patientModel.primaryMobile],
          totalVisits: patientModel.totalVisits,
        ),
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

      await FirebaseNodes.visitDocumentReference(visitId: visitModel.id).set(visitModel.toMap(),);

      PatientController().addVisitIdInActiveVisits(patientId: patientModel.id, visitId: visitModel.id);
      AdminUserController().addVisitIdInPatientsQueue(doctorId: doctorId, visitId: visitModel.id);

      return visitModel;
    }
    catch(e, s) {
      MyPrint.printOnConsole("Error in VisitController().createNewVisit():$e");
      MyPrint.logOnConsole(s);
    }

    return null;
  }
}