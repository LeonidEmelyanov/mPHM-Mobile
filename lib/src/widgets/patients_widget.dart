import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/patient_bloc.dart';
import 'package:mphm_mobile/src/models/patient_model.dart';
import 'package:mphm_mobile/src/widgets/base_loading_widget.dart';
import 'package:provider/provider.dart';

class PatientsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LoadingWidget<PatientModel>(
        title: "Patients",
        bloc: Provider.of<PatientBloc>(context),
        getListTiles: (patient) => ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 40,
              ),
              title: Text(
                  "${patient.surname} ${patient.name} ${patient.lastname}"),
              subtitle: Text("Age: ${patient.age.toString()}"),
              onTap: () {},
            ),
      );
}
