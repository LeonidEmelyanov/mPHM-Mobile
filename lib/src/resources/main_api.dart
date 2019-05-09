import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mphm_mobile/src/models/doctor_model.dart';
import 'package:mphm_mobile/src/models/patient.dart';

class MainApi {
  final _dio = Dio(BaseOptions(
    baseUrl: "http://smarttechappl.com/",
    responseType: ResponseType.plain,
  ));

  Future<Doctor> login(String login, String password) async {
    final response = await _dio
        .post("Login", queryParameters: {"login": login, "password": password});
    return Doctor.fromJson(json.decode(response.data));
  }

  Future<Patients> getPatients(int doctorId) async {
    final response = await _dio.post("Patients/GetByDoctor",
        queryParameters: {"doctorId": doctorId.toString()});
    return Patients.fromJson(json.decode(response.data));
  }
}
