import 'package:hms_models/hms_models.dart';

class ObservationModel {
  String icon = "";
  String name = "";
  String value = "";
  int priority = 0;
  String note = "";
  Map<String,dynamic> values = <String,dynamic>{};

  ObservationModel({this.icon = "", this.name = "", this.value = "", this.priority = 0, this.note = "",
    Map<String, dynamic>? values,
  }){
    this.values = values ?? <String, dynamic>{};
  }

  ObservationModel.fromMap(Map<String, dynamic> map) {
    icon = ParsingHelper.parseStringMethod(map['icon']);
    name = ParsingHelper.parseStringMethod(map['name']);
    value = ParsingHelper.parseStringMethod(map['value']);
    priority = ParsingHelper.parseIntMethod(map['priority']);
    note = ParsingHelper.parseStringMethod(map['note']);
    values.clear();
    Map<String, dynamic> valuesMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(map['values']);
    valuesMap.forEach((key, value) {
      if(value != null) {
        values[key] = value;
      }
    });
  }

  Map<String, dynamic> toMap({bool toJson = false,}) {
    return {
      'icon': icon,
      'name': name,
      'value': value,
      'priority': priority,
      'note': note,
      "values" : toJson ? values.map((key, value) => MapEntry(key, value)) : values,
    };
  }

  @override
  String toString() {
    return MyUtils.encodeJson(toMap(toJson: true));
  }
}