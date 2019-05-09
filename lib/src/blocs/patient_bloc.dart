import 'dart:async';

import 'package:mphm_mobile/src/models/patient.dart';
import 'package:mphm_mobile/src/resources/main_api.dart';

class PatientBloc {
  final _api = MainApi();
  final _patientsController = StreamController<Patients>();
  final int _doctorId;

  PatientBloc(this._doctorId) {
    getPatients();
  }

  get patients => _patientsController.stream;

  Future<void> getPatients() async {
    try {
      _patientsController.add(null);
      _patientsController.add(await _api.getPatients(_doctorId));
    } catch (e) {
      _patientsController.addError(e);
    }
  }

  dispose() async {
    await _patientsController.close();
  }
}
