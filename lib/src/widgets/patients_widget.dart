import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/patient_bloc.dart';
import 'package:mphm_mobile/src/blocs/patient_distinct_dates_bloc.dart';
import 'package:mphm_mobile/src/models/patient_model.dart';
import 'package:mphm_mobile/src/widgets/base_loading_widget.dart';
import 'package:mphm_mobile/src/widgets/distinc_dates_widget.dart';
import 'package:provider/provider.dart';

class PatientsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Patients"),
        ),
        body: LoadingWidget<PatientModel>(
          bloc: Provider.of<PatientBloc>(context),
          tilesBuilder: (patient) => ListTile(
                leading: Icon(
                  Icons.account_circle,
                  size: 40,
                ),
                title: Text(patient.fullName),
                subtitle: Text("Age: ${patient.age.toString()}"),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider.value(
                              notifier: PatientDistincDatesBloc(patient),
                              child: DistinctDatesWidget(),
                            ),
                      ),
                    ),
              ),
        ),
      );
}
