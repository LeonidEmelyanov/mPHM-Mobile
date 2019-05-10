import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/models/patient.dart';
import 'package:mphm_mobile/src/resources/main_api.dart';

class PatientBloc with ChangeNotifier {
  final _api = MainApi();
  final _patientsController = StreamController<Patients>();
  final int _doctorId;

  PatientBloc(this._doctorId);

  get patients => _patientsController.stream;

  Future<void> getPatients() async {
    try {
      _patientsController.add(null);
      _patientsController.add(await _api.getPatients(_doctorId));
    } catch (e) {
      _patientsController.addError(e);
    }
  }

  @override
  dispose() {
    super.dispose();
    _patientsController.close();
  }
}
