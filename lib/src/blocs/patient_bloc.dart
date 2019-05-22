import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/app.dart';
import 'package:mphm_mobile/src/data/main_repository.dart';
import 'package:mphm_mobile/src/models/patients_model.dart';

class PatientBloc with ChangeNotifier {
  final _repository = App.getIt.get<MainRepository>();
  final int _doctorId;

  List<Patient> _pacients;
  bool _isLoading = true;
  bool _hasError;

  PatientBloc(this._doctorId) {
    getPatients();
  }

  List<Patient> get patients => _pacients ?? [];
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
