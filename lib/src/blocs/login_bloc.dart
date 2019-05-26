import 'package:mphm_mobile/src/blocs/base_bloc.dart';
import 'package:mphm_mobile/src/models/doctor_model.dart';

class LoginBloc extends BaseBloc<DoctorModel> {
  String _login;
  String _password;

  set login(String login) {
    _login = login;
    error = null;
  }

  set password(String password) {
    _password = password;
    error = null;
  }

  @override
  Future<DoctorModel> getData(bool reload) async =>
      repository.login(_login, _password);
}
