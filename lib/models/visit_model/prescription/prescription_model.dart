import 'package:hms_models/hms_models.dart' show ParsingHelper, MyUtils, PrescriptionMedicineDoseModel;

class PrescriptionModel {
  String medicineName = "", totalDose = "", instructions = "";
  int repeatDurationDays = 1, totalDays = 0;
  String medicineType = "";
  List<PrescriptionMedicineDoseModel> doses = <PrescriptionMedicineDoseModel>[];

  PrescriptionModel({
    this.medicineName = "",
    this.totalDose = "",
    this.instructions = "",
    this.repeatDurationDays = 1,
    this.totalDays = 0,
    this.medicineType = "",
    this.doses = const <PrescriptionMedicineDoseModel>[],
  });

  PrescriptionModel.fromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void updateFromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void _initializeFromMap(Map<String, dynamic> map) {
    medicineName = ParsingHelper.parseStringMethod(map['medicineName']);
    totalDose = ParsingHelper.parseStringMethod(map['totalDose']);
    instructions = ParsingHelper.parseStringMethod(map['instructions']);
    repeatDurationDays = ParsingHelper.parseIntMethod(map['repeatDurationDays'], defaultValue: 1);
    totalDays = ParsingHelper.parseIntMethod(map['totalDays']);
    medicineType = ParsingHelper.parseStringMethod(map['medicineType']);

    List<PrescriptionMedicineDoseModel> dosesModelsList = <PrescriptionMedicineDoseModel>[];
    List<Map> doseMapsList = ParsingHelper.parseListMethod<dynamic, Map<dynamic, dynamic>>(map['doses']);
    for (Map<dynamic, dynamic> doseMap in doseMapsList) {
      Map<String, dynamic> doseMap2 = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(doseMap);

      if(doseMap2.isNotEmpty) {
        dosesModelsList.add(PrescriptionMedicineDoseModel.fromMap(doseMap2));
      }
    }
    doses = dosesModelsList;
  }

  Map<String, dynamic> toMap({bool toJson = false}) {
    return <String, dynamic>{
      "medicineName" : medicineName,
      "totalDose" : totalDose,
      "instructions" : instructions,
      "repeatDurationDays" : repeatDurationDays,
      "totalDays" : totalDays,
      "medicineType" : medicineType,
      "doses" : doses.map((e) => e.toMap(toJson: toJson)).toList(),
    };
  }

  @override
  String toString({bool toJson = true}) {
    return toJson ? MyUtils.encodeJson(toMap(toJson: true)) : "PrescriptionModel(${toMap(toJson: false)})";
  }
}