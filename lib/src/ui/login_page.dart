import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/login_bloc.dart';
import 'package:mphm_mobile/src/models/doctor_model.dart';
import 'package:mphm_mobile/src/widgets/error_dialog.dart';
import 'package:mphm_mobile/src/widgets/login_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginBloc = Provider.of<LoginBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("mPHM Mobile"),
        ),
        body: StreamBuilder<Doctor>(
            stream: loginBloc.loginStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                ErrorDialog(snapshot.error.toString()).show(context);
              }
              if (snapshot.hasData) {
                WidgetsBinding.instance
                    .addPostFrameCallback((_) => Navigator.pushReplacementNamed(
                          context,
                          '/pacient',
                          arguments: snapshot.data,
                        ));
              }
              return LoginWidget();
            }));
  }
}
