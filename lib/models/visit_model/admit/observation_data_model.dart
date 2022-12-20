import '../../../hms_models.dart';

class ObservationsDataModel {
  Timestamp? createdTime;
  List<ObservationModel> observation = [];
  List<ObservationModel> medications = [];

  ObservationsDataModel({this.createdTime, this.observation = const [], this.medications = const [],});

  ObservationsDataModel.fromMap(Map<String, dynamic> map) {
    createdTime = ParsingHelper.parseTimestampMethod(map['createdTime']);

    List<ObservationModel> observationList = <ObservationModel>[];

    List<Map> observationListMapList = ParsingHelper.parseListMethod<dynamic, Map>(map['observation']);
    for (Map observationMap in observationListMapList) {
      Map<String, dynamic> newObservationMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(observationMap);
      if(newObservationMap.isNotEmpty) {
        ObservationModel observationData = ObservationModel.fromMap(newObservationMap);
        observationList.add(observationData);
      }
    }
    observation = observationList;

    List<ObservationModel> medicationList = <ObservationModel>[];

    List<Map> medicationListMapList = ParsingHelper.parseListMethod<dynamic, Map>(map['medication']);
    for (Map medicationMap in medicationListMapList) {
      Map<String, dynamic> newMedicationMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(medicationMap);
      if(newMedicationMap.isNotEmpty) {
        ObservationModel observationData = ObservationModel.fromMap(newMedicationMap);
        medicationList.add(observationData);
      }
    }
    medications = medicationList;
  }

  Map<String, dynamic> toMap({bool toJson = false,}) {
    return {
    "createdTime": toJson ? createdTime?.toDate().toIso8601String() : createdTime,
    "observation": observation.map((e) => e.toMap(toJson: toJson)).toList(),
    "medication": medications.map((e) => e.toMap(toJson: toJson)).toList(),
    };
  }

  @override
  String toString() {
    return MyUtils.encodeJson(toMap(toJson: true));
  }
}