import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hms_models/hms_models.dart' show ParsingHelper, MyUtils;

class PatientMetaModel {
  String id = "", name = "", bloodGroup = "", gender = "";
  Timestamp? dateOfBirth;
  int totalVisits = 0;
  String userMobile = "";

  PatientMetaModel({
    this.id = "",
    this.name = "",
    this.bloodGroup = "",
    this.gender = "",
    this.dateOfBirth,
    this.totalVisits = 0,
    this.userMobile = "",
  });

  PatientMetaModel.fromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void updateFromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void _initializeFromMap(Map<String, dynamic> map) {
    id = ParsingHelper.parseStringMethod(map['id']);
    name = ParsingHelper.parseStringMethod(map['name']);
    bloodGroup = ParsingHelper.parseStringMethod(map['bloodGroup']);
    gender = ParsingHelper.parseStringMethod(map['gender']);
    dateOfBirth = ParsingHelper.parseTimestampMethod(map['dateOfBirth']);
    totalVisits = ParsingHelper.parseIntMethod(map['totalVisits']);
    userMobile = ParsingHelper.parseStringMethod(map['userMobile']);
  }

  Map<String, dynamic> toMap({bool toJson = false}) {
    return <String, dynamic>{
      "id" : id,
      "name" : name,
      "bloodGroup" : bloodGroup,
      "gender" : gender,
      "dateOfBirth" : toJson ? dateOfBirth?.toDate().toIso8601String() : dateOfBirth,
      "totalVisits" : totalVisits,
      "userMobiles" : userMobile,
    };
  }

  @override
  String toString({bool toJson = true}) {
    return toJson ? MyUtils.encodeJson(toMap(toJson: true)) : "PatientMetaModel(${toMap(toJson: false)})";
  }
}