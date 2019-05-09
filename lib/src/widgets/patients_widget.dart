import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/patient_bloc.dart';
import 'package:mphm_mobile/src/models/patient.dart';
import 'package:provider/provider.dart';

class PatientsWidget extends StatelessWidget {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  StatelessElement createElement() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState?.show());
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PatientBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Patients"),
      ),
      body: StreamBuilder<Patients>(
        stream: bloc.patients,
        builder: (context, snapshot) {
          final patients = snapshot.data?.patients ?? [];

          return RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () => bloc.getPatients(),
            child: ListView.builder(
              itemCount: patients.length,
              itemBuilder: (context, index) {
                final patient = patients[index];

                return ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    size: 40,
                  ),
                  title: Text(
                      "${patient.surname} ${patient.name} ${patient.lastname}"),
                  subtitle: Text("Age: ${patient.age.toString()}"),
                  onTap: () {},
                );
              },
            ),
          );
        },
      ),
    );
  }
}
