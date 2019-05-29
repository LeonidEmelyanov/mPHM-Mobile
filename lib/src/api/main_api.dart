import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mphm_mobile/src/models/chart_data_fragment_model.dart';
import 'package:mphm_mobile/src/models/data_info_model.dart';
import 'package:mphm_mobile/src/models/day_info_model.dart';
import 'package:mphm_mobile/src/models/distinct_date_model.dart';
import 'package:mphm_mobile/src/models/doctor_model.dart';
import 'package:mphm_mobile/src/models/ecg_summary.dart';
import 'package:mphm_mobile/src/models/holter_table_model.dart';
import 'package:mphm_mobile/src/models/patient_model.dart';

class MainApi {
  final _dio = Dio(
    BaseOptions(
      baseUrl: "http://smarttechappl.com/",
      responseType: ResponseType.plain,
    ),
  );

  Future<DoctorModel> login(String login, String password) async {
    final response = await _dio.post(
      "Login",
      queryParameters: {"login": login, "password": password},
    );
    return DoctorModel.fromJson(json.decode(response.data));
  }

  Future<List<PatientModel>> getPatients(int doctorId) async {
    final response = await _dio.post(
      "Patients/GetByDoctor",
      queryParameters: {"doctorId": doctorId},
    );
    return json
        .decode(response.data)["Data"]
        .map<PatientModel>((item) => PatientModel.fromJson(item))
        .toList();
  }

  Future<List<DayInfoModel>> getDayInfosByPatient(int patientId) async {
    final result = await _dio.post(
      "Data/GetDayInfosByPatient",
      queryParameters: {"patientId": patientId},
    );
    return json
        .decode(result.data)["Data"]
        .map<DayInfoModel>((item) => DayInfoModel.fromJson(item))
        .toList();
  }

  Future<List<DistinctDateModel>> getDistinctDates(int patientId) async {
    final response = await _dio.post(
      "data/GetDistinctDates",
      queryParameters: {"patientId": patientId},
    );
    return json
        .decode(response.data)["Data"]
        .map<DistinctDateModel>((item) => DistinctDateModel.fromJson(item))
        .toList();
  }

  Future<List<DataInfoModel>> getDatasByDate(int date, int patientId) async {
    final response = await _dio.post(
      "data/GetDatasByDate",
      queryParameters: {
        "oDateAsUnixTimeStamp": date,
        "patientId": patientId,
      },
    );
    return json
        .decode(response.data)["Data"]
        .map<DataInfoModel>((item) => DataInfoModel.fromJson(item))
        .toList();
  }

  Future<HolterTableModel> getHolterTableByDay(int unixDate) async {
    final response = await _dio.post(
      "holtertable/getByDay",
      queryParameters: {"unixDate": unixDate},
    );
    return HolterTableModel.fromJson(json.decode(response.data));
  }

  Future<ChartDataFragmentModel> getChartDataFragment(
    String selectedLead,
    int dataId,
    int fragmentId,
    int initPoint,
    int screenWidthMm,
  ) async {
    final response =
        await _dio.post("data/GetDataFragmentWithMaxPoints", queryParameters: {
      "selectedLead": selectedLead,
      "dataId": dataId,
      "fragmentId": fragmentId,
      "initPoint": initPoint,
      "screenWidthMm": screenWidthMm,
    });
    return ChartDataFragmentModel.json(json.decode(response.data));
  }

  Future<EcgSummary> getEcgSummary(int dataId) async {
    final respose = await _dio.post(
      "data/GetEcgSummary",
      queryParameters: {"dataId": dataId},
    );
    return EcgSummary.fromJson(json.decode(respose.data));
  }

  Future<List<PatientModel>> getPatientsByDoctor(int doctorId) async {
    final result = await _dio.post(
      "Patients/GetByDoctor",
      queryParameters: {"doctorId": doctorId},
    );
    return json
        .decode(result.data)["Data"]
        .map<PatientModel>((item) => PatientModel.fromJson(item))
        .toList();
  }
}
