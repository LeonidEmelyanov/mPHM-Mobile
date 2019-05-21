import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/data/main_repository.dart';
import 'package:mphm_mobile/src/models/patient_model.dart';

class PatientBloc with ChangeNotifier {
  final MainRepository _repository;
  final int _doctorId;

  Patients _pacients;
  bool _isLoading = true;
  bool _hasError;

  PatientBloc(this._repository, this._doctorId) {
    getPatients();
  }

  List<Patient> get patients => _pacients?.patients ?? [];
  get isLoading => _isLoading;
  get hasError => _hasError;

  Future<void> getPatients([bool reload = false]) async {
    try {
      _pacients = null;
      _isLoading = !reload;
      _hasError = false;
      notifyListeners();

      _pacients = await _repository.getPatients(_doctorId, reload);
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
