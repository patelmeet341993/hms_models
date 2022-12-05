import 'package:cloudinary_sdk/cloudinary_sdk.dart';

import '../configs/cloudinary_api_keys.dart';
import 'my_print.dart';

class CloudinaryManager {
  static CloudinaryManager? _instance;

  factory CloudinaryManager({required bool isDev}) => _instance ??= CloudinaryManager._(isDev: isDev);

  late Cloudinary cloudinary;

  CloudinaryManager._({required bool isDev}) {
    cloudinary = Cloudinary.full(
      apiKey: CloudinaryApiKeys.getCloudinaryApiKey(isDev: isDev),
      apiSecret: CloudinaryApiKeys.getCloudinaryApiSecret(isDev: isDev),
      cloudName: CloudinaryApiKeys.getCloudinaryCloudName(isDev: isDev),
    );
  }

  Future<CloudinaryResponse?> uploadResource({required CloudinaryUploadResource resourceToUpload}) async {
    CloudinaryResponse? cloudinaryResponse;
    try {
      cloudinaryResponse = await cloudinary.uploadResource(resourceToUpload);
    }
    catch(e, s) {
      MyPrint.printOnConsole("Error in CloudinaryManager._uploadResource():$e");
      MyPrint.printOnConsole(s);
    }

    return cloudinaryResponse;
  }

  Future<List<CloudinaryResponse>> uploadResources({required List<CloudinaryUploadResource> resourcesToUpload}) async {
    List<CloudinaryResponse> cloudinaryResponse = [];
    try {
      cloudinaryResponse = await cloudinary.uploadResources(resourcesToUpload);
    }
    catch(e, s) {
      MyPrint.printOnConsole("Error in CloudinaryManager._uploadResources():$e");
      MyPrint.printOnConsole(s);
    }

    return cloudinaryResponse;
  }

  Future<bool> deleteImagesFromCloudinary({required List<String> images}) async {
    images.removeWhere((element) => element.isEmpty);
    if(images.isEmpty) {
      return true;
    }

    try {
      CloudinaryResponse cloudinaryResponse = await cloudinary.deleteResources(urls: images);
      return cloudinaryResponse.isSuccessful && cloudinaryResponse.isResultOk;
    }
    catch(e, s) {
      MyPrint.printOnConsole("Error in Deleting images from cloudinary:$e");
      MyPrint.printOnConsole(s);
      return false;
    }
  }
}