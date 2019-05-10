import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/models/doctor_model.dart';
import 'package:mphm_mobile/src/resources/main_api.dart';

class LoginBloc with ChangeNotifier {
  final _loginApi = MainApi();
  final _loginController = StreamController<Doctor>();
  final _loadingController = StreamController<bool>();

  String _login;
  String _password;

  get loginStream => _loginController.stream;
  get loadingStream => _loadingController.stream;

  set login(String login) {
    _login = login;
    _loadingController.add(false);
  }

  set password(String password) {
    _password = password;
    _loadingController.add(false);
  }

  doLogin() async {
    try {
      _loadingController.add(true);
      _loginController.add(await _loginApi.login(_login, _password));

      _login = null;
      _password = null;
    } catch (e) {
      _loadingController.addError(e);
    }
  }

  @override
  dispose() {
    super.dispose();
    _loginController.close();
    _loadingController.close();
  }
}
