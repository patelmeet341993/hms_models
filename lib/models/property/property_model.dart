import 'package:hms_models/hms_models.dart';

class PropertyModel {
  List<ObservationModel> observations = <ObservationModel>[];
  List<ObservationModel> medications = <ObservationModel>[];

  PropertyModel({
    List<ObservationModel>? observations,
    List<ObservationModel>? medications,
  }) {
    this.observations = observations ?? <ObservationModel>[];
    this.medications = medications ?? <ObservationModel>[];
  }

  PropertyModel.fromMap(Map<String, dynamic> map) {
    List<ObservationModel> observationsList = <ObservationModel>[];
    List<Map> observationsMapList = ParsingHelper.parseListMethod<dynamic, Map>(map['observation']);
    for (Map observationsMap in observationsMapList) {
      Map<String, dynamic> newObservationMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(observationsMap);
      if(newObservationMap.isNotEmpty) {
        ObservationModel observationsModel = ObservationModel.fromMap(newObservationMap);
        observationsList.add(observationsModel);
      }
    }
    observations = observationsList;

    List<ObservationModel> medicationsList = <ObservationModel>[];
    List<Map> medicationsMapList = ParsingHelper.parseListMethod<dynamic, Map>(map['medications']);
    for (Map medicationsMap in medicationsMapList) {
      Map<String, dynamic> newMedicationsMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(medicationsMap);
      if(newMedicationsMap.isNotEmpty) {
        ObservationModel observationsModel = ObservationModel.fromMap(newMedicationsMap);
        medicationsList.add(observationsModel);
      }
    }
    medications = medicationsList;
  }

  Map<String, dynamic> toMap({bool toJson = false}) {
    return {
    'observation' : observations.map((v) => v.toMap(toJson: toJson)).toList(),
    'medications': medications.map((v) => v.toMap(toJson: toJson)).toList(),
    };
  }

  @override
  String toString() {
    return MyUtils.encodeJson(toMap(toJson: true));
  }
}