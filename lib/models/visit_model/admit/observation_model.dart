import 'package:hms_models/hms_models.dart';

class ObservationModel {
  String icon = "";
  String name = "";
  String value = "";
  int priority = 0;
  String note = "";

  ObservationModel({this.icon = "", this.name = "", this.value = "", this.priority = 0, this.note = ""});

  ObservationModel.fromMap(Map<String, dynamic> json) {
    icon = ParsingHelper.parseStringMethod(json['icon']);
    name = ParsingHelper.parseStringMethod(json['name']);
    value = ParsingHelper.parseStringMethod(json['value']);
    priority = ParsingHelper.parseIntMethod(json['priority']);
    note = ParsingHelper.parseStringMethod(json['note']);
  }

  Map<String, dynamic> toMap({bool toJson = false,}) {
    return {
      'icon': icon,
      'name': name,
      'value': value,
      'priority': priority,
      'note': note,
    };
  }

  @override
  String toString() {
    return MyUtils.encodeJson(toMap(toJson: true));
  }
}