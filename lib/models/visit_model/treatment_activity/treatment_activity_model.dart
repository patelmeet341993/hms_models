import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hms_models/hms_models.dart' show ParsingHelper, MyUtils;

class TreatmentActivityModel {
  Timestamp? createdTime;
  String treatmentActivityStatus = "";

  TreatmentActivityModel({
    this.createdTime,
    this.treatmentActivityStatus = "",
  });

  TreatmentActivityModel.fromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void updateFromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void _initializeFromMap(Map<String, dynamic> map) {
    createdTime = ParsingHelper.parseTimestampMethod(map['createdTime']);
    treatmentActivityStatus = ParsingHelper.parseStringMethod(map['treatmentActivityStatus']);
  }

  Map<String, dynamic> toMap({bool toJson = false}){
    return  <String, dynamic>{
      'createdTime' : createdTime,
      'treatmentActivityStatus' : treatmentActivityStatus,
    };
  }

  @override
  String toString({bool toJson = true}) {
    return toJson ? MyUtils.encodeJson(toMap(toJson: true)) : "TreatmentActivityModel(${toMap(toJson: false)})";
  }
}



