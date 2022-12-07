import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hms_models/hms_models.dart' show ParsingHelper, MyUtils;

class PatientModel {
  String id = "", name = "", profilePicture = "", bloodGroup = "", gender = "", primaryMobile = "";
  Timestamp? dateOfBirth, createdTime;
  int totalVisits = 0;
  bool active = false, isProfileComplete = false;
  List<String> userMobiles = [];
  //Map<String,Timestamp> visitDataHistory = {};

  PatientModel({
    this.id = "",
    this.name = "",
    this.profilePicture = "",
    this.bloodGroup = "",
    this.gender = "",
    this.primaryMobile = "",
    this.dateOfBirth,
    this.createdTime,
    this.totalVisits = 0,
    this.active = false,
    this.isProfileComplete = false,
    List<String>? userMobiles,
   // this.visitDataHistory = const {},
  }) {
    this.userMobiles = userMobiles ?? <String>[];
  }

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
    primaryMobile = ParsingHelper.parseStringMethod(map['primaryMobile']);
    dateOfBirth = ParsingHelper.parseTimestampMethod(map['dateOfBirth']);
    createdTime = ParsingHelper.parseTimestampMethod(map['createdTime']);
    totalVisits = ParsingHelper.parseIntMethod(map['totalVisits']);
    active = ParsingHelper.parseBoolMethod(map['active']);
    isProfileComplete = ParsingHelper.parseBoolMethod(map['isProfileComplete']);
    userMobiles = ParsingHelper.parseListMethod<dynamic, String>(map['userMobiles']).toSet().toList();
  }

  Map<String, dynamic> toMap({bool toJson = false}) {
    return <String, dynamic>{
      "id" : id,
      "name" : name,
      "profilePicture" : profilePicture,
      "bloodGroup" : bloodGroup,
      "gender" : gender,
      "primaryMobile" : primaryMobile,
      "dateOfBirth" : toJson ? dateOfBirth?.toDate().toIso8601String() : dateOfBirth,
      "createdTime" : toJson ? createdTime?.toDate().toIso8601String() : createdTime,
      "totalVisits" : totalVisits,
      "active" : active,
      "isProfileComplete" : isProfileComplete,
      "userMobiles" : userMobiles.toSet().toList(),
    };
  }

  @override
  String toString({bool toJson = false}) {
    return toJson ? MyUtils.encodeJson(toMap(toJson: true)) : "PatientModel(${toMap(toJson: false)})";
  }
}