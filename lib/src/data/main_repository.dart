import 'package:mphm_mobile/src/api/main_api.dart';
import 'package:mphm_mobile/src/data/repository.dart';
import 'package:mphm_mobile/src/models/doctor_model.dart';
import 'package:mphm_mobile/src/models/patient.dart';

class MainRepository extends Repository {
  final _api = MainApi();

  Future<Doctor> login(String login, String password) async =>
      await _api.login(login, password);

  Future<Patients> getPatients(int doctorId, bool reload) async =>
      getData("patients", reload, () => _api.getPatients(doctorId));
}
