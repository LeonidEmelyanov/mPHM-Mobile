import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/models/patient.dart';
import 'package:mphm_mobile/src/resources/main_api.dart';

class PatientBloc with ChangeNotifier {
  final _api = MainApi();
  final int _doctorId;

  Patients _pacients;
  bool _hasError;

  PatientBloc(this._doctorId);

  List<Patient> get patients => _pacients?.patients ?? [];
  get hasError => _hasError;

  Future<void> getPatients() async {
    try {
      _pacients = null;
      _hasError = false;
      notifyListeners();

      _pacients = await _api.getPatients(_doctorId);
    } catch (e) {
      _hasError = true;
    } finally {
      notifyListeners();
    }
  }
}
