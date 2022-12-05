import 'package:cloudinary_sdk/cloudinary_sdk.dart';

import '../utils/my_print.dart';
import 'constants.dart';

class CloudinaryTransformations {
  static String transformImageUrlForPatientWidget(String imageUrl) {
    if(!isCloudinaryImage(imageUrl)) return imageUrl;

    try {
      String transformedImage = CloudinaryImage(imageUrl)
          .transform()
          .height(CloudinaryImageResize.patientImageSize)
          .width(CloudinaryImageResize.patientImageSize)
          .scale()
          .generate() ?? imageUrl;
      transformedImage = fixCloudinaryImageUrlIssue(imageUrl, transformedImage);
      return transformedImage;
    }
    catch(e, s) {
      MyPrint.printOnConsole("Error in Transforming image '$imageUrl' For Patient Widget in CloudinaryTransformations.transformImageUrlForPatientWidget():$e");
      MyPrint.printOnConsole(s);
      return imageUrl;
    }
  }

  static String fixCloudinaryImageUrlIssue(String originalImageUrl, String newImageUrl) {
    String fileFullName = originalImageUrl.substring(originalImageUrl.lastIndexOf("/") + 1);
    // MyPrint.printOnConsole("fileFullName '$fileFullName'");
    String fileName = fileFullName.substring(0, fileFullName.lastIndexOf("."));
    // MyPrint.printOnConsole("Name '$fileName' Contains Dot:${fileName.contains(("."))}");
    // newImageUrl = newImageUrl.substring(0, newImageUrl.lastIndexOf(fileName));
    // newImageUrl = newImageUrl + fileFullName;
    if(fileName.contains(("."))) {
      newImageUrl = newImageUrl.substring(0, newImageUrl.lastIndexOf(fileName));
      newImageUrl = newImageUrl + fileFullName;
    }
    else {
      // newImageUrl = newImageUrl.substring(0, newImageUrl.lastIndexOf(fileName));
      // newImageUrl = newImageUrl + fileFullName;
    }

    return newImageUrl;
  }

  static bool isCloudinaryImage(String imageUrl) {
    return imageUrl.contains("res.cloudinary.com");
  }
}