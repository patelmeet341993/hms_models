import 'package:hms_models/hms_models.dart';

class PatientGender {
  static const String male = "Male";
  static const String female = "Female";
  static const String other = "Other";
}

class MedicineType {
  static const String tablet = "Tablet";
  static const String syrup = "Syrup";
  static const String other = "Other";
}

class AdminUserType {
  static const String admin = "Admin";
  static const String doctor = "Doctor";
  static const String pharmacy = "Pharmacy";
  static const String laboratory = "Laboratory";
  static const String reception = "Reception";
}

class FirebaseNodes {
  //region Admin Users
  static const String adminUsersCollection = "admin_users";

  static MyFirestoreCollectionReference get adminUsersCollectionReference => FirestoreController.collectionReference(
    collectionName: FirebaseNodes.adminUsersCollection,
  );

  static MyFirestoreDocumentReference adminUserDocumentReference({String? userId}) => FirestoreController.documentReference(
    collectionName: FirebaseNodes.adminUsersCollection,
    documentId: userId,
  );
  //endregion

  //region Patient
  static const String patientCollection = "patient";

  static MyFirestoreCollectionReference get patientCollectionReference => FirestoreController.collectionReference(
    collectionName: FirebaseNodes.patientCollection,
  );

  static MyFirestoreDocumentReference patientDocumentReference({String? patientId}) => FirestoreController.documentReference(
    collectionName: FirebaseNodes.patientCollection,
    documentId: patientId,
  );
  //endregion

  //region Visits
  static const String visitsCollection = "visits";

  static MyFirestoreCollectionReference get visitsCollectionReference => FirestoreController.collectionReference(
    collectionName: FirebaseNodes.visitsCollection,
  );

  static MyFirestoreDocumentReference visitDocumentReference({String? visitId}) => FirestoreController.documentReference(
    collectionName: FirebaseNodes.visitsCollection,
    documentId: visitId,
  );
  //endregion

  //region Timestamp Collection
  static const String timestampCollection = "timestamp_collection";

  static MyFirestoreCollectionReference get timestampCollectionReference => FirestoreController.collectionReference(
    collectionName: FirebaseNodes.timestampCollection,
  );
  //endregion
}

class PrescriptionMedicineDoseTime {
  static const String morning = "Morning";
  static const String afternoon = "Afternoon";
  static const String evening = "Evening";
  static const String night = "Night";
}

class PaymentModes {
  static const String cash = "Cash";
  static const String upi = "UPI";
  static const String creditCard = "Credit Card";
  static const String debitCard = "Debit Card";
}

class PaymentStatus {
  static const String pending = "Pending";
  static const String paid = "Paid";
}

class TreatmentActivityStatus {
  static const String billPay = "billPay";
  static const String registered = "registered";
  static const String prescribed = "prescribed";
  static const String completed = "completed";
}

class QRCodeTypes {
  static const String patient = "Patient";
  static const String visit = "Visit";
}

class QRCodeGenerator {
  static String generatePatientQRCode({required String patientId}) {
    return MyUtils.encodeJson({
      "id" : patientId,
      "type" : QRCodeTypes.patient,
    });
  }

  static String generateVisitQRCode({required String visitId}) {
    return MyUtils.encodeJson({
      "id" : visitId,
      "type" : QRCodeTypes.visit,
    });
  }
}
