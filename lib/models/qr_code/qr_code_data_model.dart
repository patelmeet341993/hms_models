import 'package:hms_models/hms_models.dart';

class QRCodeDataModel {
  String id = "", type = "";

  QRCodeDataModel({
    this.id = "",
    this.type = "",
  });

  QRCodeDataModel.fromEncodedString(String data) {
    dynamic value = MyUtils.decodeJson(data);

    Map<String, dynamic> map = ParsingHelper.parseMapMethod(value);

    id = ParsingHelper.parseStringMethod(map['id']);
    type = ParsingHelper.parseStringMethod(map['type']);
  }

  Map<String, dynamic> toMap() {
    return {
      "id" : id,
      "type" : type,
    };
  }

  String toEncodedString() {
    return MyUtils.encodeJson(toMap());
  }

  @override
  String toString() {
    return toEncodedString();
  }
}