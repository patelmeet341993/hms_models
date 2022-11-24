import 'package:hms_models/hms_models.dart' show ParsingHelper, MyUtils;

class VitalsModel {
  String bloodGroup="";
  double? height,weight,pulse,bpSystolic,bpDiastolic,temperature;

  VitalsModel({
    this.bloodGroup="",
    this.height,
    this.bpSystolic,
    this.bpDiastolic,
    this.pulse,
    this.temperature,
    this.weight
  });

  VitalsModel.fromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void updateFromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void _initializeFromMap(Map<String, dynamic> map) {
    bloodGroup = ParsingHelper.parseStringMethod(map['bloodGroup']);
    height = ParsingHelper.parseDoubleMethod(map['height']);
    weight = ParsingHelper.parseDoubleMethod(map['weight']);
    bpSystolic = ParsingHelper.parseDoubleMethod(map['bpSystolic']);
    bpDiastolic = ParsingHelper.parseDoubleMethod(map['bpDiastolic']);
    pulse = ParsingHelper.parseDoubleMethod(map['pulse']);
    temperature = ParsingHelper.parseDoubleMethod(map['temperature']);
  }

  Map<String, dynamic> toMap({bool toJson = false}) {
    return <String, dynamic>{
      "bloodGroup" : bloodGroup,
      "height" : height,
      "weight" : weight,
      "bpSystolic" : bpSystolic,
      "bpDiastolic" : bpDiastolic,
      "pulse" : pulse,
      "temperature" : temperature,
    };
  }

  @override
  String toString({bool toJson = true}) {
    return toJson ? MyUtils.encodeJson(toMap(toJson: true)) : "VitalsModel(${toMap(toJson: false)})";
  }
}