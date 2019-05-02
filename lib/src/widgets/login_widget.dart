import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/login_bloc.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatelessWidget {
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var _loginBloc = Provider.of<LoginBloc>(context);

    return StreamBuilder<bool>(
        initialData: false,
        stream: _loginBloc.loadingStream,
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Login",
                  ),
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  enabled: !snapshot.data,
                  onChanged: (login) => _loginBloc.login = login,
                  onSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_passwordFocusNode),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  obscureText: true,
                  autocorrect: false,
                  enabled: !snapshot.data,
                  focusNode: _passwordFocusNode,
                  onChanged: (password) => _loginBloc.password = password,
                  onSubmitted: (_) => _loginBloc.doLogin(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: snapshot.data
                    ? CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Theme.of(context).bottomAppBarColor),
                          ),
                          color: Theme.of(context).primaryColor,
                          onPressed: () => _loginBloc.doLogin(),
                        ),
                      ),
              )
            ],
          );
        });
  }
}
