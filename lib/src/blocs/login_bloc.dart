import 'dart:async';

import 'package:mphm_mobile/src/models/doctor_model.dart';
import 'package:mphm_mobile/src/resources/login_api.dart';

class LoginBloc {
  final _loginApi = LoginApi();
  final _loginController = StreamController<Doctor>();
  var _isLoading = false;

  String _login;
  String _password;

  get loginStream => _loginController.stream;
  get isLoading => _isLoading;

  set login(String login) {
    _login = login;
    _loginController.add(null);
  }

  set password(String password) {
    _password = password;
    _loginController.add(null);
  }

  doLogin() async {
    try {
      _isLoading = true;
      _loginController.add(null);
      _loginController.add(await _loginApi.login(_login, _password));

      _login = null;
      _password = null;
    } catch (e) {
      _isLoading = false;
      _loginController.addError(Exception());
    }
  }

  dispose() async {
    await _loginController.close();
  }
}
