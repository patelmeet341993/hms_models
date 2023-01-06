import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hms_models/hms_models.dart' show AdmitModel, DiagnosisModel, MyUtils, ParsingHelper, PatientMetaModel, PatientModel, PharmaBillingModel, TreatmentActivityModel, VisitBillingModel, VitalsModel;

class VisitModel {
  String id = "", patientId = "", patientName = "", description = "", previousVisitId = "", currentDoctorId = "", currentDoctorName = "", hospitalId = "", hospitalName = "";
  Map<String, String> doctors = {};
  Timestamp? createdTime, updatedTime, completedTime;
  double weight = 0, totalVisitAmount = 0;
  VitalsModel? vitals;
  bool active = false,isAttendedByDoctor = false,isTreatmentActiveStream = false, isAdmitted = false;
  List<DiagnosisModel> diagnosis = <DiagnosisModel>[];
  Map<String, VisitBillingModel> visitBillings = {};
  PharmaBillingModel? pharmaBilling;
  PatientModel? patientModel;
  List<TreatmentActivityModel> treatmentActivity = <TreatmentActivityModel>[];
  List<TreatmentActivityModel> treatmentActivityDetailedLog = <TreatmentActivityModel>[];
  AdmitModel? admitModel;

  VisitModel({
    this.id = "",
    this.patientId = "",
    this.patientName = "",
    this.description = "",
    this.previousVisitId = "",
    this.currentDoctorId = "",
    this.currentDoctorName = "",
    this.hospitalId = "",
    this.hospitalName = "",
    Map<String, String>? doctors,
    this.createdTime,
    this.updatedTime,
    this.completedTime,
    this.weight = 0,
    this.totalVisitAmount = 0,
    this.active = false,
    this.isAttendedByDoctor = false,
    this.isTreatmentActiveStream = false,
    this.isAdmitted = false,
    this.vitals,
    List<DiagnosisModel>? diagnosis,
    Map<String, VisitBillingModel>? visitBillings,
    this.pharmaBilling,
    this.patientModel,
    List<TreatmentActivityModel>? treatmentActivity,
    List<TreatmentActivityModel>? treatmentActivityDetailedLog,
    this.admitModel,
  }) {
    this.doctors = doctors ?? <String, String>{};
    this.diagnosis = diagnosis ?? <DiagnosisModel>[];
    this.visitBillings = visitBillings ?? <String, VisitBillingModel>{};
    this.treatmentActivity = treatmentActivity ?? <TreatmentActivityModel>[];
    this.treatmentActivityDetailedLog = treatmentActivityDetailedLog ?? <TreatmentActivityModel>[];
  }

  VisitModel.fromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void updateFromMap(Map<String, dynamic> map) {
    _initializeFromMap(map);
  }

  void _initializeFromMap(Map<String, dynamic> map) {
    id = ParsingHelper.parseStringMethod(map['id']);
    patientId = ParsingHelper.parseStringMethod(map['patientId']);
    patientName = ParsingHelper.parseStringMethod(map['patientName']);
    description = ParsingHelper.parseStringMethod(map['description']);
    previousVisitId = ParsingHelper.parseStringMethod(map['previousVisitId']);
    currentDoctorId = ParsingHelper.parseStringMethod(map['currentDoctorId']);
    currentDoctorName = ParsingHelper.parseStringMethod(map['currentDoctorName']);
    hospitalId = ParsingHelper.parseStringMethod(map['hospitalId']);
    hospitalName = ParsingHelper.parseStringMethod(map['hospitalName']);
    createdTime = ParsingHelper.parseTimestampMethod(map['createdTime']);
    updatedTime = ParsingHelper.parseTimestampMethod(map['updatedTime']);
    completedTime = ParsingHelper.parseTimestampMethod(map['completedTime']);
    weight = ParsingHelper.parseDoubleMethod(map['weight']);
    totalVisitAmount = ParsingHelper.parseDoubleMethod(map['totalVisitAmount']);
    active = ParsingHelper.parseBoolMethod(map['active']);
    isAttendedByDoctor = ParsingHelper.parseBoolMethod(map['isAttendedByDoctor']);
    isTreatmentActiveStream = ParsingHelper.parseBoolMethod(map['isTreatmentActiveStream']);
    isAdmitted = ParsingHelper.parseBoolMethod(map['isAdmitted']);


    List<DiagnosisModel> diagnosisList = <DiagnosisModel>[];
    List<Map> diagnosisMapList = ParsingHelper.parseListMethod<dynamic, Map>(map['diagnosis']);
    for (Map diagnosisMap in diagnosisMapList) {
      Map<String, dynamic> newDiagnosisMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(diagnosisMap);
      if(newDiagnosisMap.isNotEmpty) {
        DiagnosisModel visitDiagnosisModel = DiagnosisModel.fromMap(newDiagnosisMap);
        diagnosisList.add(visitDiagnosisModel);
      }
    }
    diagnosis = diagnosisList;

    List<TreatmentActivityModel> treatmentModelList = <TreatmentActivityModel>[];

    List<Map> treatmentModelMapList = ParsingHelper.parseListMethod<dynamic, Map>(map['treatmentActivity']);
    for (Map treatmentActivityMap in treatmentModelMapList) {
      Map<String, dynamic> newTreatmentMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(treatmentActivityMap);
      if(newTreatmentMap.isNotEmpty) {
        TreatmentActivityModel visitTreatmentModel = TreatmentActivityModel.fromMap(newTreatmentMap);
        treatmentModelList.add(visitTreatmentModel);
      }
    }
    treatmentActivity = treatmentModelList;

    List<TreatmentActivityModel> treatmentModelLogList = <TreatmentActivityModel>[];
    List<Map> treatmentModelLogMapList = ParsingHelper.parseListMethod<dynamic, Map>(map['treatmentActivity']);
    for (Map treatmentActivityLogMap in treatmentModelLogMapList) {
      Map<String, dynamic> newTreatmentLogMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(treatmentActivityLogMap);
      if(newTreatmentLogMap.isNotEmpty) {
        TreatmentActivityModel visitTreatmentModel = TreatmentActivityModel.fromMap(newTreatmentLogMap);
        treatmentModelLogList.add(visitTreatmentModel);
      }
    }
    treatmentActivityDetailedLog = treatmentModelLogList;

    Map<String, VisitBillingModel> finalVisitBillingsMap = <String, VisitBillingModel>{};
    Map<String, dynamic> visitBillingsMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(map['visitBillings']);
    if(visitBillingsMap.isNotEmpty) {
      visitBillingsMap.forEach((String doctorId, dynamic value) {
        Map<String, dynamic> visitBillingMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(value);
        if(visitBillingMap.isNotEmpty) {
          VisitBillingModel visitBillingModel = VisitBillingModel.fromMap(visitBillingMap);
          finalVisitBillingsMap[doctorId] = visitBillingModel;
        }
      });
    }
    visitBillings = finalVisitBillingsMap;

    Map<String, dynamic> pharmaBillingsMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(map['pharmaBilling']);
    if(pharmaBillingsMap.isNotEmpty) {
      pharmaBilling = PharmaBillingModel.fromMap(pharmaBillingsMap);
    }

    Map<String, dynamic> vitalsMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(map['vitals']);
    if(vitalsMap.isNotEmpty) {
      vitals = VitalsModel.fromMap(vitalsMap);
    }

    Map<String, dynamic> patientMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(map['patientModel']);
    if(patientMap.isNotEmpty) {
      patientModel = PatientModel.fromMap(patientMap);
    }

    Map<String, dynamic> admitMap = ParsingHelper.parseMapMethod<dynamic, dynamic, String, dynamic>(map['admitModel']);
    if(admitMap.isNotEmpty) {
      admitModel = AdmitModel.fromMap(admitMap);
    }
  }

  Map<String, dynamic> toMap({bool toJson = false}) {
    return <String, dynamic>{
      "id" : id,
      "patientId" : patientId,
      "patientName" : patientName,
      "description" : description,
      "previousVisitId" : previousVisitId,
      "currentDoctorId" : currentDoctorId,
      "currentDoctorName" : currentDoctorName,
      "hospitalId" : hospitalId,
      "hospitalName" : hospitalName,
      "createdTime" : toJson ? createdTime?.toDate().toIso8601String() : createdTime,
      "updatedTime" : toJson ? updatedTime?.toDate().toIso8601String() : updatedTime,
      "completedTime" : toJson ? completedTime?.toDate().toIso8601String() : completedTime,
      "weight" : weight,
      "totalVisitAmount" : totalVisitAmount,
      "active" : active,
      "isTreatmentActiveStream" : isTreatmentActiveStream,
      "isAdmitted" : isAdmitted,
      "isAttendedByDoctor" : isAttendedByDoctor,
      "diagnosis" : diagnosis.map((e) => e.toMap(toJson: toJson)).toList(),
      "visitBillings" : visitBillings.map((key, value) => MapEntry(key, value.toMap(toJson: toJson))),
      "treatmentActivity" : treatmentActivity.map((e) => e.toMap(toJson: toJson)).toList(),
      "treatmentActivityDetailedLog" : treatmentActivityDetailedLog.map((e) => e.toMap(toJson: toJson)).toList(),
      "pharmaBilling" : pharmaBilling?.toMap(toJson: toJson),
      "patientModel" : patientModel?.toMap(toJson: toJson),
      "vitals" : vitals?.toMap(toJson: toJson),
      "admitModel" : admitModel?.toMap(toJson: toJson),
    };
  }

  @override
  String toString({bool toJson = true}) {
    return toJson ? MyUtils.encodeJson(toMap(toJson: true)) : "VisitModel(${toMap(toJson: false)})";
  }
}