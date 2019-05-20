import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/data/main_repository.dart';
import 'package:mphm_mobile/src/models/doctor_model.dart';

class LoginBloc with ChangeNotifier {
  final MainRepository _repository;

  bool _isLoading = false;
  Doctor _doctor;
  bool _hasError = false;

  String _login;
  String _password;

  bool get isLoading => _isLoading;
  Doctor get doctor => _doctor;
  bool get hasError => _hasError;

  LoginBloc(this._repository);

  set login(String login) {
    _login = login;
    _hasError = false;
    notifyListeners();
  }

  set password(String password) {
    _password = password;
    _hasError = false;
    notifyListeners();
  }

  doLogin() async {
    try {
      _isLoading = true;
      notifyListeners();

      _doctor = await _repository.login(_login, _password);
      _login = null;
      _password = null;
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
