import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/login_bloc.dart';
import 'package:mphm_mobile/src/blocs/pacient_bloc.dart';
import 'package:mphm_mobile/src/ui/login_page.dart';
import 'package:mphm_mobile/src/ui/patient_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'mPHM Mobile',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (builder) => StatefulProvider<LoginBloc>(
                child: LoginPage(),
                valueBuilder: (context) => LoginBloc(),
                onDispose: (context, bloc) => bloc.dispose(),
              ),
          '/pacient': (builder) => StatefulProvider<PacientBloc>(
                child: PacientPage(),
                valueBuilder: (context) => PacientBloc(),
                onDispose: (context, bloc) => bloc.dispose(),
              ),
        },
      );
}
