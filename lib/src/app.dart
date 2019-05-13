import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/login_bloc.dart';
import 'package:mphm_mobile/src/themes.dart';
import 'package:mphm_mobile/src/ui/home_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: AppColors.accentColor,
        canvasColor: Colors.transparent,
      ),
      home: ChangeNotifierProvider<LoginBloc>.value(
        notifier: LoginBloc(),
        child: HomePage(),
      ),
    );
  }
}
