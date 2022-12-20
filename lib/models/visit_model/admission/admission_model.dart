import 'package:hms_models/hms_models.dart';

class AdmissionModel {
  List<ObservationsDataModel> observationDataList = [];

  AdmissionModel({this.observationDataList = const []});

  AdmissionModel.fromMap(Map<String, dynamic> map) {
    List<ObservationsDataModel> observationDataModelList = <ObservationsDataModel>[];

    List<Map> observationDataListMapList = ParsingHelper.parseListMethod<dynamic, Map>(map['observations']);
    for (Map observationDataMap in observationDataListMapList) {
      Map<String, dynamic> newObservationDataMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(observationDataMap);
      if(newObservationDataMap.isNotEmpty) {
        ObservationsDataModel observationData = ObservationsDataModel.fromMap(newObservationDataMap);
        observationDataModelList.add(observationData);
      }
    }
    observationDataList = observationDataModelList;
  }

  Map<String, dynamic> toMap({bool toJson = false}) {
    return {
      "observations":observationDataList.map((e) => e.toMap(toJson: toJson)).toList(),
    };
  }

  @override
  String toString() {
    return MyUtils.encodeJson(toMap());
  }
}