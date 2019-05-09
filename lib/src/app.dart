import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/login_bloc.dart';
import 'package:mphm_mobile/src/ui/home_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Provider<LoginBloc>(
          builder: (_) => LoginBloc(),
          child: HomePage(),
          dispose: (_, bloc) async => bloc.dispose(),
        ),
      );
}
