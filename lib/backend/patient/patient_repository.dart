import 'package:hms_models/hms_models.dart';

class PatientRepository {
  Future<PatientModel?> getPatientModelFromPatientId({required String patientId}) async {
    MyPrint.printOnConsole("PatientRepository().getPatientModelFromPatientId() called for patientId:'$patientId'");

    PatientModel? patientModel;

    try {
      if(patientId.isEmpty) {
        MyPrint.printOnConsole("Patient Id Cannot be empty");
        return patientModel;
      }

      MyFirestoreDocumentSnapshot snapshot = await FirebaseNodes.patientDocumentReference(patientId: patientId).get();
      if(snapshot.exists && snapshot.data().checkNotEmpty) {
        patientModel = PatientModel.fromMap(snapshot.data()!);
      }
    }
    catch(e, s) {
      MyPrint.printOnConsole("Error in PatientRepository().getPatientModelFromPatientId():$e");
      MyPrint.printOnConsole(s);
    }

    return patientModel;
  }

  Future<bool> createUpdatePatientWithPatientModel({required PatientModel patientModel, bool isCreate = true}) async {
    String tag = MyUtils.getUniqueIdFromUuid();

    MyPrint.printOnConsole("PatientRepository().createPatientWithPatientModel() called with patientModel:'$patientModel'", tag: tag);

    bool isUserCreated = false;

    if(patientModel.id.isEmpty) {
      return isUserCreated;
    }

    try {
      await FirebaseNodes.patientDocumentReference(patientId: patientModel.id).set(patientModel.toMap(), SetOptions(merge: !isCreate));

      MyPrint.printOnConsole("Patient Created from PatientRepository().createPatientWithPatientModel() with patientId:'${patientModel.id}'", tag: tag);
      isUserCreated = true;
    }
    catch(e,s) {
      MyPrint.printOnConsole("Error in PatientRepository().createPatientWithPatientModel():'$e'", tag: tag);
      MyPrint.printOnConsole(s ,tag: tag);
    }

    return isUserCreated;
  }

  Future<bool> updatePatientDataInFirestoreFromMap({required String patientId, required Map<String, dynamic> data}) async {
    String tag = MyUtils.getUniqueIdFromUuid();

    MyPrint.printOnConsole("PatientRepository().updatePatientDataFromMap() called with patientId:'$patientId', data:'$data'", tag: tag);

    bool isUpdated = false;

    if(patientId.isEmpty) {
      return isUpdated;
    }

    try {
      await FirebaseNodes.patientDocumentReference(patientId: patientId).update(data);

      MyPrint.printOnConsole("Patient Updated from PatientRepository().updatePatientDataFromMap() with patientId:'$patientId'", tag: tag);
      isUpdated = true;
    }
    catch(e,s) {
      MyPrint.printOnConsole("Error in PatientRepository().updatePatientDataFromMap():'$e'", tag: tag);
      MyPrint.printOnConsole(s ,tag: tag);
    }

    return isUpdated;
  }
}