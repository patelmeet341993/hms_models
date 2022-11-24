import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hms_models/hms_models.dart' show ParsingHelper, MyUtils, PharmaBillingItemModel;

class PharmaBillingModel {
  String patientId = "", paymentId = "", paymentMode = "", paymentStatus = "";
  double baseAmount = 0, discount = 0, totalAmount = 0;
  List<PharmaBillingItemModel> items = <PharmaBillingItemModel>[];
  Timestamp? createdTime;

  PharmaBillingModel({
    this.patientId = "",
    this.paymentId = "",
    this.paymentMode = "",
    this.paymentStatus = "",
    this.baseAmount = 0,
    this.discount = 0,
    this.totalAmount = 0,
    this.items = const <PharmaBillingItemModel>[],
    this.createdTime,
  });

  PharmaBillingModel.fromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void updateFromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void _initializeFromMap(Map<String, dynamic> map) {
    patientId = ParsingHelper.parseStringMethod(map['patientId']);
    paymentId = ParsingHelper.parseStringMethod(map['paymentId']);
    paymentMode = ParsingHelper.parseStringMethod(map['paymentMode']);
    paymentStatus = ParsingHelper.parseStringMethod(map['paymentStatus']);
    baseAmount = ParsingHelper.parseDoubleMethod(map['baseAmount']);
    discount = ParsingHelper.parseDoubleMethod(map['discount']);
    totalAmount = ParsingHelper.parseDoubleMethod(map['totalAmount']);

    List<PharmaBillingItemModel> itemsList = <PharmaBillingItemModel>[];
    List<Map> itemMapList = ParsingHelper.parseListMethod<dynamic, Map>(map['items']);
    for (Map itemMap in itemMapList) {
      Map<String, dynamic> newItemMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(itemMap);
      if(newItemMap.isNotEmpty) {
        PharmaBillingItemModel billingItemModel = PharmaBillingItemModel.fromMap(newItemMap);
        itemsList.add(billingItemModel);
      }
    }
    items = itemsList;

    createdTime = ParsingHelper.parseTimestampMethod(map['createdTime']);
  }

  Map<String, dynamic> toMap({bool toJson = false}) {
    return <String, dynamic>{
      "patientId" : patientId,
      "paymentId" : paymentId,
      "paymentMode" : paymentMode,
      "paymentStatus" : paymentStatus,
      "baseAmount" : baseAmount,
      "discount" : discount,
      "totalAmount" : totalAmount,
      "items" : items.map((e) => e.toMap(toJson: toJson)).toList(),
      "createdTime" : toJson ? createdTime?.toDate().toIso8601String() : createdTime,
    };
  }

  @override
  String toString({bool toJson = true}) {
    return toJson ? MyUtils.encodeJson(toMap(toJson: true)) : "PharmaBillingModel(${toMap(toJson: false)})";
  }
}