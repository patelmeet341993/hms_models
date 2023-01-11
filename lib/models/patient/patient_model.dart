import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hms_models/hms_models.dart' show ParsingHelper, MyUtils;

class PatientModel {
  String id = "", name = "", profilePicture = "", bloodGroup = "", gender = "", primaryMobile = "";
  Timestamp? dateOfBirth, createdTime;
  double height=0.0,weight=0.0;
  int totalVisits = 0;
  bool active = false, isProfileComplete = false;
  List<String> userMobiles = <String>[], visitIds = <String>[];
  Map<String, Timestamp> activeVisits = <String, Timestamp>{};

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
    this.height=0.0,
    this.weight=0.0,
    List<String>? userMobiles,
    List<String>? visitIds,
    Map<String, Timestamp>? activeVisits,
   // this.visitDataHistory = const {},
  }) {
    this.userMobiles = userMobiles ?? <String>[];
    this.visitIds = visitIds ?? <String>[];
    this.activeVisits = activeVisits ?? <String, Timestamp>{};
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
    height = ParsingHelper.parseDoubleMethod(map['height']);
    weight = ParsingHelper.parseDoubleMethod(map['weight']);
    isProfileComplete = ParsingHelper.parseBoolMethod(map['isProfileComplete']);
    userMobiles = ParsingHelper.parseListMethod<dynamic, String>(map['userMobiles']).toSet().toList();
    visitIds = ParsingHelper.parseListMethod<dynamic, String>(map['visitIds']).toSet().toList();

    activeVisits.clear();
    Map<String, dynamic> activeVisitsMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(map['activeVisits']);
    activeVisitsMap.forEach((key, value) {
      Timestamp? timeStamp = ParsingHelper.parseTimestampMethod(value);
      if(timeStamp != null) {
        activeVisits[key] = timeStamp;
      }
    });
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
      "height":height,
      "weight":weight,
      "isProfileComplete" : isProfileComplete,
      "userMobiles" : userMobiles.toSet().toList(),
      "visitIds" : visitIds.toSet().toList(),
      "activeVisits" : toJson ? activeVisits.map((key, value) => MapEntry(key, value.toDate().toIso8601String())) : activeVisits,
    };
  }

  Map<String, dynamic> toMapForVisit({bool toJson = false}) {
    return <String, dynamic>{
      "id" : id,
      "name" : name,
      "profilePicture" : profilePicture,
      "bloodGroup" : bloodGroup,
      "gender" : gender,
      "primaryMobile" : primaryMobile,
      "dateOfBirth" : toJson ? dateOfBirth?.toDate().toIso8601String() : dateOfBirth,
      "createdTime" : toJson ? createdTime?.toDate().toIso8601String() : createdTime,
      "height":height,
      "weight":weight,
      "userMobiles" : userMobiles.toSet().toList(),
    };
  }

  @override
  String toString({bool toJson = false}) {
    return toJson ? MyUtils.encodeJson(toMap(toJson: true)) : "PatientModel(${toMap(toJson: false)})";
  }
}