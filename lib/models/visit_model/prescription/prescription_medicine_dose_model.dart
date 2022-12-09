import 'package:hms_models/hms_models.dart' show ParsingHelper, MyUtils, PrescriptionMedicineDoseTime;

class PrescriptionMedicineDoseModel {
  String doseTime = PrescriptionMedicineDoseTime.morning, dose = "";
  int doseCount = 0;
  bool afterMeal = false, beforeMeal = false;

  PrescriptionMedicineDoseModel({
    this.doseTime = PrescriptionMedicineDoseTime.morning,
    this.dose = "",
    this.doseCount = 0,
    this.afterMeal = false,
    this.beforeMeal = false,
  });

  PrescriptionMedicineDoseModel.fromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void updateFromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void _initializeFromMap(Map<String, dynamic> map) {
    doseTime = ParsingHelper.parseStringMethod(map['doseTime']);
    dose = ParsingHelper.parseStringMethod(map['dose']);
    doseCount = ParsingHelper.parseIntMethod(map['doseCount']);
    afterMeal = ParsingHelper.parseBoolMethod(map['afterMeal']);
    beforeMeal = ParsingHelper.parseBoolMethod(map['beforeMeal']);
  }

  Map<String, dynamic> toMap({bool toJson = false}) {
    return <String, dynamic>{
      "doseTime" : doseTime,
      "dose" : dose,
      'doseCount' : doseCount,
      "afterMeal" : afterMeal,
      "beforeMeal" : beforeMeal,
    };
  }

  @override
  String toString({bool toJson = true}) {
    return toJson ? MyUtils.encodeJson(toMap(toJson: true)) : "PrescriptionMedicineDoseModel(${toMap(toJson: false)})";
  }
}