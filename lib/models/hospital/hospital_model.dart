import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hms_models/hms_models.dart' show ParsingHelper, MyUtils;

class HospitalModel {
  String id = "", name = "", group = "", branch = "", address = "", email = "";
  List<String> contactNumbers = <String>[];
  Timestamp? createdTime, updatedTime;

  HospitalModel({
    this.id = "",
    this.name = "",
    this.group = "",
    this.branch = "",
    this.address = "",
    this.email = "",
    this.contactNumbers = const <String>[],
    this.createdTime,
    this.updatedTime,
  });

  HospitalModel.fromMap(Map<String, dynamic> map) {
    id = ParsingHelper.parseStringMethod(map['id']);
    name = ParsingHelper.parseStringMethod(map['name']);
    group = ParsingHelper.parseStringMethod(map['group']);
    branch = ParsingHelper.parseStringMethod(map['branch']);
    address = ParsingHelper.parseStringMethod(map['address']);
    email = ParsingHelper.parseStringMethod(map['email']);
    contactNumbers = ParsingHelper.parseListMethod<dynamic, String>(map['contactNumbers']);
    createdTime = ParsingHelper.parseTimestampMethod(map['createdTime']);
    updatedTime = ParsingHelper.parseTimestampMethod(map['updatedTime']);
  }

  void updateFromMap(Map<String, dynamic> map) {
    id = ParsingHelper.parseStringMethod(map['id']);
    name = ParsingHelper.parseStringMethod(map['name']);
    group = ParsingHelper.parseStringMethod(map['group']);
    branch = ParsingHelper.parseStringMethod(map['branch']);
    address = ParsingHelper.parseStringMethod(map['address']);
    email = ParsingHelper.parseStringMethod(map['email']);
    contactNumbers = ParsingHelper.parseListMethod<dynamic, String>(map['contactNumbers']);
    createdTime = ParsingHelper.parseTimestampMethod(map['createdTime']);
    updatedTime = ParsingHelper.parseTimestampMethod(map['updatedTime']);
  }

  Map<String, dynamic> toMap({bool toJson = false,}) {
    return {
      "id" : id,
      "name" : name,
      "group" : group,
      "branch" : branch,
      "address" : address,
      "email" : email,
      "contactNumbers" : contactNumbers,
      "createdTime" : createdTime,
      "updatedTime" : updatedTime,
    };
  }

  @override
  String toString({bool toJson = false}) {
    return toJson ? MyUtils.encodeJson(toMap(toJson: true)) : "HospitalModel(${toMap(toJson: false)})";
  }
}