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
  static const String pharmaPay = "Pharma Pay";
  static const String laboratoryPay = "Laboratory Pay";
  static const String registered = "Registered";
  static const String assigned = "Assigned";
  static const String prescribed = "Prescribed";
  static const String completed = "Completed";
}

class QRCodeTypes {
  static const String patient = "Patient";
  static const String visit = "Visit";
}

class CloudinaryImageResize {
  static const int patientImageSize = 350;
}

class CloudinaryFoldersName {
  static const String patients = "patients";
}

class BloodGroup {
/*
Got from 'https://www.nhs.uk/conditions/blood-groups/'
A RhD positive (A+)
A RhD negative (A-)
B RhD positive (B+)
B RhD negative (B-)
O RhD positive (O+)
O RhD negative (O-)
AB RhD positive (AB+)
AB RhD negative (AB-)
*/

  static const String aPositive = "A+";
  static const String aNegative = "A-";
  static const String bPositive = "B+";
  static const String bNegative = "B-";
  static const String oPositive = "O+";
  static const String oNegative = "O-";
  static const String abPositive = "AB+";
  static const String abNegative = "AB-";

  static const List<String> bloodGroupsList = [
    aPositive,
    aNegative,
    bPositive,
    bNegative,
    oPositive,
    oNegative,
    abPositive,
    abNegative,
  ];

  static bool isValidBloodGroup({required String bloodGroup}) {
    return bloodGroupsList.contains(bloodGroup);
  }
}

class FirestoreExceptionCodes {
  static const String notFound = "not-found";
}

const String noUserImageUrl = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";
