import 'package:hms_models/hms_models.dart';

class VisitRepository {
  Future<VisitModel?> getVisitModelFromVisitId({required String visitId}) async {
    MyPrint.printOnConsole("VisitRepository().getVisitModelFromVisitId() called for patientId:'$visitId'");

    VisitModel? visitModel;

    try {
      if(visitId.isEmpty) {
        MyPrint.printOnConsole("Visit Id Cannot be empty");
        return visitModel;
      }

      MyFirestoreDocumentSnapshot snapshot = await FirebaseNodes.visitDocumentReference(visitId: visitId).get();
      if(snapshot.exists && snapshot.data().checkNotEmpty) {
        visitModel = VisitModel.fromMap(snapshot.data()!);
      }
    }
    catch(e, s) {
      MyPrint.printOnConsole("Error in VisitRepository().getVisitModelFromVisitId():$e");
      MyPrint.printOnConsole(s);
    }

    return visitModel;
  }

  Future<Map<String, VisitModel>> getVisitModelsFromVisitIds({required List<String> visitIds}) async {
    MyPrint.printOnConsole("VisitRepository().getVisitModelsFromVisitIds() called for visitIds:'$visitIds'");

    Map<String, VisitModel> visitModels = <String, VisitModel>{};

    try {
      List<MyFirestoreQueryDocumentSnapshot> docs = await FirestoreController.getDocsFromCollection(
        collectionReference: FirebaseNodes.visitsCollectionReference,
        docIds: visitIds,
      );

      for (MyFirestoreQueryDocumentSnapshot snapShot in docs) {
        visitModels[snapShot.id] = VisitModel.fromMap(snapShot.data());
      }
    }
    catch(e, s) {
      MyPrint.printOnConsole("Error in VisitRepository().getVisitModelsFromVisitIds():$e");
      MyPrint.printOnConsole(s);
    }

    return visitModels;
  }
}