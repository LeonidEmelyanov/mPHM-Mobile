import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/login_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class LoginWidget extends StatelessWidget {
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("mPHM mobile"),
      ),
      body: ChangeNotifierProvider.value(
        notifier: bloc,
        child: Padding(
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
                  enabled: bloc.hasError || !bloc.isLoading,
                  onChanged: (login) => bloc.login = login,
                  onSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_passwordFocusNode),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  autocorrect: false,
                  enabled: bloc.hasError || !bloc.isLoading,
                  focusNode: _passwordFocusNode,
                  onChanged: (password) => bloc.password = password,
                  onSubmitted: (_) async => bloc.loading(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      child: bloc.isLoading
                          ? Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Theme.of(context).accentColor,
                              child: Text(
                                "Loading...",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : Text(
                              bloc.hasError
                                  ? "Invalide login/Password"
                                  : "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                      color: Theme.of(context).accentColor,
                      disabledColor: bloc.hasError
                          ? Theme.of(context).errorColor
                          : Theme.of(context).accentColor,
                      onPressed: bloc.hasError || bloc.isLoading
                          ? null
                          : () async =>
                              Provider.of<LoginBloc>(context).loading(),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
