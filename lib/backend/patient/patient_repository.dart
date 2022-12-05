import 'package:hms_models/hms_models.dart';

class PatientRepository {
  Future<PatientModel?> getPatientModelFromPatientId({required String patientId}) async {
    MyPrint.printOnConsole("PatientRepository().getPatientModelFromPatientId() called for patientId:$patientId");

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
}