import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/login_bloc.dart';
import 'package:mphm_mobile/src/blocs/patient_bloc.dart';
import 'package:mphm_mobile/src/ui/login_widget.dart';
import 'package:mphm_mobile/src/ui/patients_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<LoginBloc>(
        builder: (BuildContext context, LoginBloc bloc, Widget child) =>
            bloc.data == null
                ? LoginPage()
                : ChangeNotifierProvider<PatientBloc>.value(
                    notifier: PatientBloc(doctorId: bloc.data.id),
                    child: PatientsPage(),
                  ),
      );
}
