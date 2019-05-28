import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mphm_mobile/src/app.dart';

Future main() async {
  await initializeDateFormatting("ru_ru");

  runApp(App());
}