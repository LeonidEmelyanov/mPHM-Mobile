import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/login_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class LoginWidget extends StatelessWidget {
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<LoginBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("mPHM mobile"),
      ),
      body: StreamBuilder<bool>(
        initialData: false,
        stream: _bloc.loadingStream,
        builder: (context, snapshot) => Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Login",
                        icon: Icon(Icons.account_box),
                      ),
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      enabled: snapshot.hasError || !snapshot.data,
                      onChanged: (login) => _bloc.login = login,
                      onSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_passwordFocusNode),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        icon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      autocorrect: false,
                      enabled: snapshot.hasError || !snapshot.data,
                      focusNode: _passwordFocusNode,
                      onChanged: (password) => _bloc.password = password,
                      onSubmitted: (_) async => _bloc.doLogin(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                          child: snapshot.data ?? false
                              ? Shimmer.fromColors(
                                  baseColor: Colors.white,
                                  highlightColor:
                                      Theme.of(context).primaryColor,
                                  child: Text(
                                    "Loading...",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              : Text(
                                  snapshot.hasError
                                      ? "Invalide login/Password"
                                      : "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                          color: Theme.of(context).primaryColor,
                          disabledColor: snapshot.hasError
                              ? Theme.of(context).errorColor
                              : Theme.of(context).primaryColor,
                          onPressed: snapshot.hasError || snapshot.data
                              ? null
                              : () async =>
                                  Provider.of<LoginBloc>(context).doLogin(),
                        ),
                      ),
                    ),
                  ]),
            ),
      ),
    );
  }
}
