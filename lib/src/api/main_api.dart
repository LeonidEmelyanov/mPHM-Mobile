import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mphm_mobile/src/models/chart_data_fragment_model.dart';
import 'package:mphm_mobile/src/models/day_info_model.dart';
import 'package:mphm_mobile/src/models/distinct_date_model.dart';
import 'package:mphm_mobile/src/models/doctor_model.dart';
import 'package:mphm_mobile/src/models/holter_table_model.dart';
import 'package:mphm_mobile/src/models/patients_model.dart';

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

  Future<List<Patient>> getPatients(int doctorId) async {
    final response = await _dio.post(
      "Patients/GetByDoctor",
      queryParameters: {"doctorId": doctorId},
    );
    return json
        .decode(response.data)["Data"]
        .map<Patient>((item) => Patient.fromJson(item))
        .toList();
  }

  Future<DistinctDatesModel> getDistinctDates(int patientId) async {
    final response = await _dio.post(
      "data/GetDistinctDates",
      queryParameters: {"pitientID": patientId},
    );
    return DistinctDatesModel.fromJson(json.decode(response.data));
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

  Future<List<Patient>> getPatientsByDoctor(int doctorId) async {
    final result = await _dio.post(
      "Patients/GetByDoctor",
      queryParameters: {"doctorId": doctorId},
    );
    return json
        .decode(result.data)
        .map<Patient>((item) => Patient.fromJson(item))
        .toList();
  }

  Future<List<DayInfoModel>> getDayInfosByPatient(int patientId) async {
    final result = await _dio.post(
      "Data/GetDayInfosByPatient",
      queryParameters: {"patientId": patientId},
    );
    return json
        .decode(result.data)
        .map<DayInfoModel>((item) => DayInfoModel.fromJson(item))
        .toList();
  }
}
