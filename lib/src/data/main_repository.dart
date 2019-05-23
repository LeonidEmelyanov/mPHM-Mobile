import 'package:mphm_mobile/src/api/main_api.dart';
import 'package:mphm_mobile/src/data/repository.dart';
import 'package:mphm_mobile/src/models/chart_data_fragment_model.dart';
import 'package:mphm_mobile/src/models/data_info_model.dart';
import 'package:mphm_mobile/src/models/day_info_model.dart';
import 'package:mphm_mobile/src/models/distinct_date_model.dart';
import 'package:mphm_mobile/src/models/doctor_model.dart';
import 'package:mphm_mobile/src/models/holter_table_model.dart';
import 'package:mphm_mobile/src/models/patient_model.dart';

class MainRepository extends Repository {
  final _api = MainApi();

  Future<DoctorModel> login(String login, String password) async =>
      await _api.login(login, password);

  Future<List<PatientModel>> getPatients(int doctorId, bool reload) async =>
      getData(
        "patients",
        reload,
        () => _api.getPatients(doctorId),
      );

  Future<List<DistinctDateModel>> getDistinctDates(
          int patientId, bool reload) async =>
      getData(
        "distinc_dates_for_$patientId",
        reload,
        () => _api.getDistinctDates(patientId),
      );

  Future<List<DataInfoModel>> getDatasByDate(
    int date,
    int patientId,
    bool reload,
  ) async =>
      getData(
        "data_info_from_${date}_for_$patientId",
        reload,
        () => _api.getDatasByDate(date, patientId),
      );

  Future<HolterTableModel> getHolterTableByDay(
          int unixDate, bool reload) async =>
      getData(
        "holter_table_for_$unixDate",
        reload,
        () => _api.getHolterTableByDay(unixDate),
      );

  Future<ChartDataFragmentModel> getChartDataFragment(
    String selectedLead,
    int dataId,
    int fragmentId,
    int initPoint,
    int screenWidthMm,
    bool reload,
  ) async =>
      getData(
          "chart_data_fragment_for_${selectedLead}_with_${dataId}_and_${fragmentId}_at_$initPoint",
          reload,
          () => _api.getChartDataFragment(
                selectedLead,
                dataId,
                fragmentId,
                initPoint,
                screenWidthMm,
              ));

  Future<List<PatientModel>> getPatientsByDoctor(
          int doctorId, bool reload) async =>
      getData("patients_by_doctor_$doctorId", reload,
          () => _api.getPatientsByDoctor(doctorId));

  Future<List<DayInfoModel>> getDayInfosByPatient(
          int patientId, bool reload) async =>
      getData("data_infos_by_patient_$patientId", reload,
          () => _api.getDayInfosByPatient(patientId));
}
