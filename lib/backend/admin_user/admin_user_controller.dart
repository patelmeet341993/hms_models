import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/my_print.dart';
import '../../utils/my_utils.dart';
import 'admin_user_repository.dart';

class AdminUserController {
  late AdminUserRepository adminUserRepository;

  AdminUserController({AdminUserRepository? repository}) {
    adminUserRepository = repository ?? AdminUserRepository();
  }

  Future<bool> addVisitIdInPatientsQueue({required String doctorId, required String visitId}) async {
    String tag = MyUtils.getUniqueIdFromUuid();

    MyPrint.printOnConsole("AdminUserController().addVisitIdInPatientsQueue() called with doctorId:'$doctorId', visitId:'$visitId'", tag: tag);

    bool isUpdated = false;

    if(doctorId.isEmpty || visitId.isEmpty) return isUpdated;

    try {
      Map<String, dynamic> firestoreData = <String, dynamic>{
        "patientQueueForDoctor" : FieldValue.arrayUnion([visitId]),
      };

      isUpdated = await adminUserRepository.updateAdminUserDataInFirestoreFromMap(
        userId: doctorId,
        data: firestoreData,
      );
      MyPrint.printOnConsole("isDoctorUpdated:'$isUpdated'", tag: tag);
    }
    catch(e, s) {
      MyPrint.printOnConsole("Error in AdminUserController().addVisitIdInPatientsQueue():'$e'", tag: tag);
      MyPrint.printOnConsole(s, tag: tag);
    }

    return isUpdated;
  }
}