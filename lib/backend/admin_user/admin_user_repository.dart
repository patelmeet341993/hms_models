import 'package:hms_models/hms_models.dart';

class AdminUserRepository {
  Future<AdminUserModel?> getAdminUserModelFromUserId({required String userId}) async {
    MyPrint.printOnConsole("AdminUserRepository().getAdminUserModelFromUserId() called for patientId:'$userId'");

    AdminUserModel? adminUserModel;

    try {
      if(userId.isEmpty) {
        MyPrint.printOnConsole("User Id Cannot be empty");
        return adminUserModel;
      }

      MyFirestoreDocumentSnapshot snapshot = await FirebaseNodes.adminUserDocumentReference(userId: userId).get();
      if(snapshot.exists && snapshot.data().checkNotEmpty) {
        adminUserModel = AdminUserModel.fromMap(snapshot.data()!);
      }
    }
    catch(e, s) {
      MyPrint.printOnConsole("Error in AdminUserRepository().getAdminUserModelFromUserId():$e");
      MyPrint.printOnConsole(s);
    }

    return adminUserModel;
  }

  Future<bool> createUpdateAdminUserWithAdminUserModel({required AdminUserModel adminUserModel, bool isCreate = true}) async {
    String tag = MyUtils.getUniqueIdFromUuid();

    MyPrint.printOnConsole("AdminUserRepository().createUpdateAdminUserWithAdminUserModel() called with adminUserModel:'$adminUserModel'", tag: tag);

    bool isUserCreated = false;

    if(adminUserModel.id.isEmpty) {
      return isUserCreated;
    }

    try {
      await FirebaseNodes.adminUserDocumentReference(userId: adminUserModel.id).set(adminUserModel.toMap(), SetOptions(merge: !isCreate));

      MyPrint.printOnConsole("AdminUser Created from AdminUserRepository().createUpdateAdminUserWithAdminUserModel() with userId:'${adminUserModel.id}'", tag: tag);
      isUserCreated = true;
    }
    catch(e,s) {
      MyPrint.printOnConsole("Error in AdminUserRepository().createUpdateAdminUserWithAdminUserModel():'$e'", tag: tag);
      MyPrint.printOnConsole(s ,tag: tag);
    }

    return isUserCreated;
  }

  Future<bool> updateAdminUserDataInFirestoreFromMap({required String userId, required Map<String, dynamic> data}) async {
    String tag = MyUtils.getUniqueIdFromUuid();

    MyPrint.printOnConsole("AdminUserRepository().updateAdminUserDataInFirestoreFromMap() called with userId:'$userId', data:'$data'", tag: tag);

    bool isUpdated = false;

    if(userId.isEmpty) {
      return isUpdated;
    }

    try {
      await FirebaseNodes.adminUserDocumentReference(userId: userId).update(data);

      MyPrint.printOnConsole("Patient Updated from AdminUserRepository().updateAdminUserDataInFirestoreFromMap() with userId:'$userId'", tag: tag);
      isUpdated = true;
    }
    catch(e,s) {
      MyPrint.printOnConsole("Error in AdminUserRepository().updateAdminUserDataInFirestoreFromMap():'$e'", tag: tag);
      MyPrint.printOnConsole(s ,tag: tag);
    }

    return isUpdated;
  }
}