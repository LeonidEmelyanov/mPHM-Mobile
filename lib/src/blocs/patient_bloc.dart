import 'dart:async';

import 'package:mphm_mobile/src/blocs/base_bloc.dart';
import 'package:mphm_mobile/src/models/patient_model.dart';

class PatientBloc extends BaseBloc<List<PatientModel>> {
  final int _doctorId;

  PatientBloc(this._doctorId) {
    getPatients();
  }

  Future<void> getPatients([bool reload = false]) async {
    try {
      isLoading = !reload;

      data = await repository.getPatients(_doctorId, reload);
    } catch (e) {
      error = e;
    }
  }
}
