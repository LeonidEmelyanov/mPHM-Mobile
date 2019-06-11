import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/api/main_api.dart';
import 'package:mphm_mobile/src/data/base_repository.dart';
import 'package:mphm_mobile/src/models/chart_data_fragment_model.dart';
import 'package:mphm_mobile/src/models/data_info_model.dart';
import 'package:mphm_mobile/src/models/day_info_model.dart';
import 'package:mphm_mobile/src/models/distinct_date_model.dart';
import 'package:mphm_mobile/src/models/doctor_model.dart';
import 'package:mphm_mobile/src/models/ecg_summary.dart';
import 'package:mphm_mobile/src/models/holter_table_model.dart';
import 'package:mphm_mobile/src/models/patient_model.dart';

class MainRepository extends BaseRepository {
  final _api = MainApi();

  Future<DoctorModel> login(String login, String password) async =>
      await _api.login(login, password);

  Future<List<PatientModel>> getPatients(int doctorId, bool reload) async =>
      getData(
        "patients",
        reload,
        () => _api.getPatients(doctorId),
      );

  Future<List<DayInfoModel>> getDayInfosByPatient(
          int patientId, bool reload) async =>
      getData(
        "patients/$patientId",
        reload,
        () => _api.getDayInfosByPatient(patientId),
      );

  Future<List<DistinctDateModel>> getDistinctDates(
          int patientId, bool reload) async =>
      getData(
        "patients/$patientId/dates",
        reload,
        () => _api.getDistinctDates(patientId),
      );

  Future<List<DataInfoModel>> getDatasByDate(
    int date,
    int patientId,
    bool reload,
  ) async =>
      getData(
        "patients/$patientId/dates/$date",
        reload,
        () => _api.getDatasByDate(date, patientId),
      );

  Future<EcgSummary> getEcgSummary(
          int patientId, int date, int dataId, bool reload) async =>
      getData("patients/$patientId/dates/$date/ecg/$dataId", reload,
          () => _api.getEcgSummary(dataId));

  Future<ChartDataFragmentModel> getChartDataFragment(
    int patientId,
    int date,
    int dataId,
    String selectedLead,
    int startPoint,
    int qtyPoints,
    bool reload,
  ) async =>
      getData(
          "patients/$patientId/dates/$date/ecg/$dataId/$startPoint",
          reload,
          () => _api.getDataFragment(
              dataId, selectedLead, startPoint, qtyPoints));

  Future<HolterTableModel> getHolterTableByDay(
          int unixDate, bool reload) async =>
      getData(
        "holter_table/$unixDate",
        reload,
        () => _api.getHolterTableByDay(unixDate),
      );

  Future<List<PatientModel>> getPatientsByDoctor(
          int doctorId, bool reload) async =>
      getData(
        "patients_by_doctor/$doctorId",
        reload,
        () => _api.getPatientsByDoctor(doctorId),
      );

  List<Offset> getChartPoints(
    String id,
    int startPoint,
    List<Offset> Function() func,
  ) {
    final key = "chartPoints/$id/$startPoint";
    return cash[key] ?? (cash[key] = func());
  }
}
