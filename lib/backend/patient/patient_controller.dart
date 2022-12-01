import '../../models/patient/patient_model.dart';
import 'patient_repository.dart';

class PatientController {
  late PatientRepository patientRepository;

  PatientController({PatientRepository? repository}) {
    patientRepository = repository ?? PatientRepository();
  }

  Future<PatientModel?> getPatientModelFromPatientId({required String patientId}) async {
    return patientRepository.getPatientModelFromPatientId(patientId: patientId);
  }
}