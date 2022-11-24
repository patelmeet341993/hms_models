import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hms_models/hms_models.dart' show ParsingHelper, MyUtils;

class VisitBillingModel {
  String doctorId = "", paymentId = "", paymentMode = "";
  double fee = 0, discount = 0, totalFees = 0;
  Timestamp? createdTime;

  VisitBillingModel({
    this.doctorId = "",
    this.paymentId = "",
    this.paymentMode = "",
    this.fee = 0,
    this.discount = 0,
    this.totalFees = 0,
    this.createdTime,
  });

  VisitBillingModel.fromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void updateFromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void _initializeFromMap(Map<String, dynamic> map) {
    doctorId = ParsingHelper.parseStringMethod(map['doctorId']);
    paymentId = ParsingHelper.parseStringMethod(map['paymentId']);
    paymentMode = ParsingHelper.parseStringMethod(map['paymentMode']);
    fee = ParsingHelper.parseDoubleMethod(map['fee']);
    discount = ParsingHelper.parseDoubleMethod(map['discount']);
    totalFees = ParsingHelper.parseDoubleMethod(map['totalFees']);
    createdTime = ParsingHelper.parseTimestampMethod(map['createdTime']);
  }

  Map<String, dynamic> toMap({bool toJson = false}) {
    return <String, dynamic>{
      "doctorId" : doctorId,
      "paymentId" : paymentId,
      "paymentMode" : paymentMode,
      "fee" : fee,
      "discount" : discount,
      "totalFees" : totalFees,
      "createdTime" : toJson ? createdTime?.toDate().toIso8601String() : createdTime,
    };
  }

  @override
  String toString({bool toJson = true}) {
    return toJson ? MyUtils.encodeJson(toMap(toJson: true)) : "VisitBillingModel(${toMap(toJson: false)})";
  }
}