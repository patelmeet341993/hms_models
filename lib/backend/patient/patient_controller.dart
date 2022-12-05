import '../../models/common/new_document_data_model.dart';
import '../../models/patient/patient_model.dart';
import '../../utils/my_print.dart';
import '../../utils/my_utils.dart';
import 'patient_repository.dart';

class PatientController {
  late PatientRepository patientRepository;

  PatientController({PatientRepository? repository}) {
    patientRepository = repository ?? PatientRepository();
  }

  Future<PatientModel?> getPatientModelFromPatientId({required String patientId}) async {
    return patientRepository.getPatientModelFromPatientId(patientId: patientId);
  }

  Future<bool> updatePatientData({required PatientModel patientModel}) async {
    String tag = MyUtils.getUniqueIdFromUuid();

    MyPrint.printOnConsole("PatientController().updatePatientData() called with patientModel:'$patientModel'", tag: tag);

    bool isUpdated = false;

    if(patientModel.id.isEmpty) return isUpdated;

    try {
      if(patientModel.createdTime == null) {
        NewDocumentDataModel newDocumentDataModel = await MyUtils.getNewDocIdAndTimeStamp(isGetTimeStamp: true);
        patientModel.createdTime = newDocumentDataModel.timestamp;
      }

      isUpdated = await patientRepository.createUpdatePatientWithPatientModel(patientModel: patientModel, isCreate: false);
      MyPrint.printOnConsole("isPatientUpdated:'$isUpdated'", tag: tag);
    }
    catch(e, s) {
      MyPrint.printOnConsole("Error in PatientController().updatePatientData():'$e'", tag: tag);
      MyPrint.printOnConsole(s, tag: tag);
    }

    return isUpdated;
  }
}