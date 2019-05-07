import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/login_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class LoginWidget extends StatelessWidget {
  final _passwordFocusNode = FocusNode();
  final _hasError;

  LoginWidget(this._hasError);

  @override
  Widget build(BuildContext context) {
    var _loginBloc = Provider.of<LoginBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("mPHM mobile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _loginFiled(context, _loginBloc),
            _passwordField(context, _loginBloc),
            _behaviorButton(context, _loginBloc),
          ],
        ),
      ),
    );
  }

  Widget _loginFiled(BuildContext context, LoginBloc bloc) => TextField(
        decoration: InputDecoration(
          labelText: "Login",
          icon: Icon(Icons.account_box),
        ),
        autocorrect: false,
        textInputAction: TextInputAction.next,
        enabled: !bloc.isLoading,
        onChanged: (login) => bloc.login = login,
        onSubmitted: (_) =>
            FocusScope.of(context).requestFocus(_passwordFocusNode),
      );

  Widget _passwordField(BuildContext context, LoginBloc bloc) => TextField(
        decoration: InputDecoration(
          labelText: "Password",
          icon: Icon(Icons.lock),
        ),
        obscureText: true,
        autocorrect: false,
        enabled: !bloc.isLoading,
        focusNode: _passwordFocusNode,
        onChanged: (password) => bloc.password = password,
        onSubmitted: (_) => bloc.doLogin(),
      );

  Widget _behaviorButton(BuildContext context, LoginBloc bloc) => bloc.isLoading
      ? Shimmer.fromColors(
          baseColor: Theme.of(context).primaryColor,
          highlightColor: Colors.white,
          child: _loginButton(context, bloc),
        )
      : _loginButton(context, bloc);

  Widget _loginButton(BuildContext context, LoginBloc bloc) => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SizedBox(
          width: double.infinity,
          child: FlatButton(
            child: Text(
              _hasError ? "Invalide login/Password" : "Login",
              style: TextStyle(color: Theme.of(context).bottomAppBarColor),
            ),
            color: Theme.of(context).primaryColor,
            disabledColor: Theme.of(context).errorColor,
            onPressed:
                _hasError || bloc.isLoading ? null : () => bloc.doLogin(),
          ),
        ),
      );
}
