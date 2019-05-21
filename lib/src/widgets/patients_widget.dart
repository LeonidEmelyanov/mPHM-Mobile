import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/patient_bloc.dart';
import 'package:provider/provider.dart';

class PatientsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<PatientBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Patients"),
      ),
      body: ChangeNotifierProvider.value(
        notifier: _bloc,
        child: AnimatedCrossFade(
          duration: Duration(milliseconds: 300),
          crossFadeState: _bloc.isLoading ?? false
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: Center(
            child: CircularProgressIndicator(),
          ),
          secondChild: RefreshIndicator(
            onRefresh: () => _bloc.getPatients(true),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _bloc.patients?.length,
              itemBuilder: (context, index) {
                final patient = _bloc.patients[index];

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
          ),
        ),
      ),
    );
  }
}
