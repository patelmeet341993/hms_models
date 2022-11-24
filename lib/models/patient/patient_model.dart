import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hms_models/hms_models.dart' show ParsingHelper, MyUtils;

class PatientModel {
  String id = "", name = "", profilePicture = "", bloodGroup = "", gender = "";
  Timestamp? dateOfBirth, createdTime;
  int totalVisits = 0;
  bool active = false;
  List<String> userMobiles = [];
  //Map<String,Timestamp> visitDataHistory = {};

  PatientModel({
    this.id = "",
    this.name = "",
    this.profilePicture = "",
    this.bloodGroup = "",
    this.gender = "",
    this.dateOfBirth,
    this.createdTime,
    this.totalVisits = 0,
    this.active = false,
    this.userMobiles = const [],
   // this.visitDataHistory = const {},
  });

  PatientModel.fromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void updateFromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void _initializeFromMap(Map<String, dynamic> map) {
    id = ParsingHelper.parseStringMethod(map['id']);
    name = ParsingHelper.parseStringMethod(map['name']);
    profilePicture = ParsingHelper.parseStringMethod(map['profilePicture']);
    bloodGroup = ParsingHelper.parseStringMethod(map['bloodGroup']);
    gender = ParsingHelper.parseStringMethod(map['gender']);
    dateOfBirth = ParsingHelper.parseTimestampMethod(map['dateOfBirth']);
    createdTime = ParsingHelper.parseTimestampMethod(map['createdTime']);
    totalVisits = ParsingHelper.parseIntMethod(map['totalVisits']);
    active = ParsingHelper.parseBoolMethod(map['active']);
    userMobiles = ParsingHelper.parseListMethod<dynamic, String>(map['userMobiles']).toSet().toList();
  }

  Map<String, dynamic> toMap({bool toJson = false}) {
    return <String, dynamic>{
      "id" : id,
      "name" : name,
      "profilePicture" : profilePicture,
      "bloodGroup" : bloodGroup,
      "gender" : gender,
      "dateOfBirth" : dateOfBirth,
      "createdTime" : toJson ? createdTime?.toDate().toIso8601String() : createdTime,
      "totalVisits" : totalVisits,
      "active" : active,
      "userMobiles" : userMobiles.toSet().toList(),
    };
  }

  @override
  String toString({bool toJson = false}) {
    return toJson ? MyUtils.encodeJson(toMap(toJson: true)) : "PatientModel(${toMap(toJson: false)})";
  }
}