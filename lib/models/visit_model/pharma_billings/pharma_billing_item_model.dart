import 'package:hms_models/hms_models.dart' show ParsingHelper, MyUtils;

class PharmaBillingItemModel {
  String medicineName = "", dose = "", dosePerUnit = "";
  double unitCount = 0, price = 0, discount = 0, finalAmount = 0;

  PharmaBillingItemModel({
    this.medicineName = "",
    this.dose = "",
    this.dosePerUnit = "",
    this.unitCount = 0,
    this.price = 0,
    this.discount = 0,
    this.finalAmount = 0,
  });

  PharmaBillingItemModel.fromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void updateFromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void _initializeFromMap(Map<String, dynamic> map) {
    medicineName = ParsingHelper.parseStringMethod(map['medicineName']);
    dose = ParsingHelper.parseStringMethod(map['dose']);
    dosePerUnit = ParsingHelper.parseStringMethod(map['dosePerUnit']);
    unitCount = ParsingHelper.parseDoubleMethod(map['unitCount']);
    price = ParsingHelper.parseDoubleMethod(map['price']);
    discount = ParsingHelper.parseDoubleMethod(map['discount']);
    finalAmount = ParsingHelper.parseDoubleMethod(map['finalAmount']);
  }

  Map<String, dynamic> toMap({bool toJson = false}) {
    return <String, dynamic>{
      "medicineName" : medicineName,
      "dose" : dose,
      "dosePerUnit" : dosePerUnit,
      "unitCount" : unitCount,
      "price" : price,
      "discount" : discount,
      "finalAmount" : finalAmount,
    };
  }

  @override
  String toString({bool toJson = true}) {
    return toJson ? MyUtils.encodeJson(toMap(toJson: true)) : "PharmaBillingItemModel(${toMap(toJson: false)})";
  }
}