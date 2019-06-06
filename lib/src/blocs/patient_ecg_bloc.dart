import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/base_bloc.dart';
import 'package:mphm_mobile/src/models/chart_data_fragment_model.dart';
import 'package:mphm_mobile/src/models/ecg_summary.dart';
import 'package:mphm_mobile/src/models/patient_model.dart';

class PatientEcgBloc extends BaseBloc<EcgSummary> {
  final Leads lead;
  final PatientModel patient;
  final int date;
  final int dataId;

  PatientEcgBloc({
    @required this.lead,
    @required this.patient,
    @required this.date,
    @required this.dataId,
  }) {
    loading();
  }

  @override
  Future<EcgSummary> getData(bool reload) =>
      repository.getEcgSummary(patient.id, date, dataId, reload);
}
