import 'package:mphm_mobile/src/api/main_api.dart';
import 'package:mphm_mobile/src/data/repository.dart';
import 'package:mphm_mobile/src/models/distinct_date_model.dart';
import 'package:mphm_mobile/src/models/doctor_model.dart';
import 'package:mphm_mobile/src/models/patients_model.dart';

class MainRepository extends Repository {
  final _api = MainApi();

  Future<DoctorModel> login(String login, String password) async =>
      await _api.login(login, password);

  Future<List<Patient>> getPatients(int doctorId, bool reload) async => getData(
        "patients",
        reload,
        () => _api.getPatients(doctorId),
      );

  Future<DistinctDatesModel> getDistinctDates(int patientId, bool reload) async =>
      getData(
        "distinc_dates_for_$patientId",
        reload,
        () => _api.getDistinctDates(patientId),
      );
}
