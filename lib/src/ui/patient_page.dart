import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/pacient_bloc.dart';
import 'package:mphm_mobile/src/models/doctor_model.dart';
import 'package:provider/provider.dart';

class PacientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pacientBloc = Provider.of<PacientBloc>(context);
    final doctor = ModalRoute.of<Doctor>(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Pacient details"),
      ),
    );
  }
}
