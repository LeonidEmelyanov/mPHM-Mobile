import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/base_bloc.dart';
import 'package:mphm_mobile/src/models/patient_model.dart';

class PatientBloc extends BaseBloc<List<PatientModel>> {
  final int doctorId;

  PatientBloc({@required this.doctorId}) {
    loading();
  }

  @override
  Future<List<PatientModel>> getData(bool reload) =>
      repository.getPatients(doctorId, reload);
}
