import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hms_models/hms_models.dart' show ParsingHelper, MyUtils;

class AdminUserModel {
  String id = "", name = "", username = "", password = "", role = "", description = "", imageUrl = "";
  Map<String, dynamic> scannerData = <String, dynamic>{};
  bool isActive = false;
  Timestamp? createdTime;

  AdminUserModel({
    this.id = "",
    this.name = "",
    this.username = "",
    this.password = "",
    this.role = "",
    this.description = "",
    this.imageUrl = "",
    Map<String, dynamic>? scannerData,
    this.isActive = false,
    this.createdTime,
  }) {
    this.scannerData = scannerData ?? <String, dynamic>{};
  }

  AdminUserModel.fromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void updateFromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void _initializeFromMap(Map<String, dynamic> map) {
    id = ParsingHelper.parseStringMethod(map['id']);
    name = ParsingHelper.parseStringMethod(map['name']);
    username = ParsingHelper.parseStringMethod(map['username']);
    password = ParsingHelper.parseStringMethod(map['password']);
    role = ParsingHelper.parseStringMethod(map['role']);
    description = ParsingHelper.parseStringMethod(map['description']);
    imageUrl = ParsingHelper.parseStringMethod(map['imageUrl']);
    scannerData = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(map['scannerData']);
    isActive = ParsingHelper.parseBoolMethod(map['isActive']);
    createdTime = ParsingHelper.parseTimestampMethod(map['createdTime']);
  }

  Map<String, dynamic> toMap({bool toJson = false}) {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "username": username,
      "password": password,
      "role": role,
      "description": description,
      "imageUrl": imageUrl,
      "scannerData": scannerData,
      "isActive": isActive,
      "createdTime": toJson ? createdTime?.toDate().toIso8601String() : createdTime,
    };
  }

  @override
  String toString({bool toJson = true}) {
    return toJson ? MyUtils.encodeJson(toMap(toJson: true)) : "AdminUserModel(${toMap(toJson: false)})";
  }
}