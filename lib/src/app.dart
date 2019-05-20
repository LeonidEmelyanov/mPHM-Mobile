import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/login_bloc.dart';
import 'package:mphm_mobile/src/data/main_repository.dart';
import 'package:mphm_mobile/src/ui/home_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final _repository = MainRepository();

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.grey[800],
            accentColor: Colors.blue[800],
            errorColor: Colors.red[800]),
        home: MultiProvider(
          providers: [
            Provider.value(
              value: _repository,
            ),
            ChangeNotifierProvider<LoginBloc>.value(
              notifier: LoginBloc(_repository),
              child: HomePage(),
            ),
          ],
        ),
      );
}
