import 'package:dio/dio.dart';
import 'package:mphm_mobile/src/models/doctor_model.dart';

class LoginApi {
  final _dio = Dio(BaseOptions(baseUrl: "http://smarttechappl.com/"));

  Future<Doctor> login(String login, String password) async {
    final response =
        await _dio.post("Login", queryParameters: {"login": login, "password": password});
    return Doctor.fromJson(response.data);
  }
}
