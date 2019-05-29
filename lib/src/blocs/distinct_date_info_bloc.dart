import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/base_bloc.dart';
import 'package:mphm_mobile/src/models/data_info_model.dart';
import 'package:mphm_mobile/src/models/distinct_date_model.dart';
import 'package:mphm_mobile/src/models/patient_model.dart';

class DistinctDateBloc extends BaseBloc<List<DataInfoModel>> {
  final PatientModel patient;
  final DistinctDateModel model;

  DistinctDateBloc({@required this.patient, @required this.model});

  @override
  Future<List<DataInfoModel>> getData(bool reload) => repository.getDatasByDate(
        (model.date.millisecondsSinceEpoch / 1000).round(),
        patient.id,
        reload,
      );
}
