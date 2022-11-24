import 'package:hms_models/hms_models.dart' show ParsingHelper, MyUtils, PrescriptionModel;

class DiagnosisModel {
  String doctorId = "", diagnosisDescription = "";
  List<PrescriptionModel> prescription = <PrescriptionModel>[];

  DiagnosisModel({
    this.doctorId = "",
    this.diagnosisDescription = "",
    this.prescription = const <PrescriptionModel>[],
  });

  DiagnosisModel.fromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void updateFromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void _initializeFromMap(Map<String, dynamic> map) {
    doctorId = ParsingHelper.parseStringMethod(map['doctorId']);
    diagnosisDescription = ParsingHelper.parseStringMethod(map['diagnosisDescription']);

    List<PrescriptionModel> prescriptionMain = <PrescriptionModel>[];
    List<Map> prescriptionMapList = ParsingHelper.parseListMethod<dynamic, Map<dynamic, dynamic>>(map['prescription']);
    for (Map prescriptionMap in prescriptionMapList) {
      Map<String, dynamic> newPrescriptionMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(prescriptionMap);
      if(newPrescriptionMap.isNotEmpty) {
        PrescriptionModel visitDiagnosisPrescriptionModel = PrescriptionModel.fromMap(newPrescriptionMap);
        prescriptionMain.add(visitDiagnosisPrescriptionModel);
      }
    }
    prescription = prescriptionMain;
  }

  Map<String, dynamic> toMap({bool toJson = false}) {
    return <String, dynamic>{
      "doctorId" : doctorId,
      "diagnosisDescription" : diagnosisDescription,
      "prescription" : prescription.map((e) => e.toMap(toJson: toJson)).toList(),
    };
  }

  @override
  String toString({bool toJson = true}) {
    return toJson ? MyUtils.encodeJson(toMap(toJson: true)) : "DiagnosisModel(${toMap(toJson: false)})";
  }
}