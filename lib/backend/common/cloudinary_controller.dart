import 'dart:typed_data';

import 'package:hms_models/hms_models.dart';
import 'package:hms_models/utils/cloudinary_manager.dart';

class CloudinaryController {
  late CloudinaryManager cloudinaryManager;

  CloudinaryController({bool isDev = true}) {
    cloudinaryManager = CloudinaryManager(isDev: isDev);
  }

  Future<String> uploadPatientImage({required String patientId, required Uint8List bytes}) async {
    try {
      String name = MyUtils.getUniqueIdFromUuid();

      CloudinaryResponse? response = await cloudinaryManager.uploadResource(resourceToUpload: CloudinaryUploadResource(
        resourceType: CloudinaryResourceType.image,
        folder: CloudinaryFoldersName.patients,
        fileName: "${patientId}_$name",
        fileBytes: bytes,
      ));

      if(response != null && response.isSuccessful && response.isResultOk && (response.url ?? "").isNotEmpty) {
        return response.url!;
      }
    }
    catch(e, s) {
      MyPrint.printOnConsole("Error in CloudinaryController().uploadPatientImage():$e");
      MyPrint.printOnConsole(s);
    }

    return "";
  }
}