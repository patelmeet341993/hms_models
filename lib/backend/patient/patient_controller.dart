import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future<bool> updatePatientProfileData({required String patientId, String? name, String? primaryMobile, Timestamp? dateOfBirth, bool isUpdateDOB = false, String? gender,
    String? bloodGroup, String? profilePicture, bool? isProfileComplete}) async {
    String tag = MyUtils.getUniqueIdFromUuid();

    MyPrint.printOnConsole("PatientController().updatePatientProfileData() called with patientId:'$patientId'", tag: tag);

    bool isUpdated = false;

    if(patientId.isEmpty) return isUpdated;

    try {
      Map<String, dynamic> patientData = <String, dynamic>{};
      if(name != null) patientData['name'] = name;
      if(primaryMobile != null) patientData['primaryMobile'] = primaryMobile;
      if(isUpdateDOB) patientData['dateOfBirth'] = dateOfBirth;
      if(gender != null) patientData['gender'] = gender;
      if(bloodGroup != null) patientData['bloodGroup'] = bloodGroup;
      if(profilePicture != null) patientData['profilePicture'] = profilePicture;
      if(isProfileComplete != null) patientData['isProfileComplete'] = isProfileComplete;
      MyPrint.printOnConsole("patientData to update:$patientData", tag: tag);

      if(patientData.isNotEmpty) {
        isUpdated = await patientRepository.updatePatientDataInFirestoreFromMap(patientId: patientId, data: patientData);
      }
      else {
        isUpdated = true;
      }

      MyPrint.printOnConsole("isPatientUpdated:'$isUpdated'", tag: tag);
    }
    catch(e, s) {
      MyPrint.printOnConsole("Error in PatientController().updatePatientProfileData():'$e'", tag: tag);
      MyPrint.printOnConsole(s, tag: tag);
    }

    return isUpdated;
  }
}