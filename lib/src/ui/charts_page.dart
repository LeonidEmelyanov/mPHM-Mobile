import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/charts_fragment_bloc.dart';
import 'package:mphm_mobile/src/blocs/patient_ecg_bloc.dart';
import 'package:mphm_mobile/src/models/ecg_summary.dart';
import 'package:mphm_mobile/src/widgets/charts_fragment_widget.dart';
import 'package:provider/provider.dart';

class ChartsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 32) / 150 * 2.54;

    return Consumer<PatientEcgBloc>(
      builder: (BuildContext _, PatientEcgBloc bloc, Widget __) {
        final qtyPoints = _getQtyPoints(width, bloc.data);

        return Scaffold(
          appBar: AppBar(
            title: Text("Cardiogram of ${bloc.patient.shortName}"),
          ),
          body: bloc.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : PageView.builder(
                  itemBuilder: (BuildContext _, int index) =>
                      ChangeNotifierProvider.value(
                        notifier: ChartsFragmentBloc(
                            patientId: bloc.patient.id,
                            date: bloc.date,
                            dataId: bloc.dataId,
                            selectedLead: "All",
                            qtyPoints: qtyPoints,
                            startPoint: index * qtyPoints,
                            frequency: bloc.data.frequency),
                        child: ChartsFragmentWidget(),
                      ),
                  itemCount: ((bloc.data?.qtyPoints ?? 0) / qtyPoints).round(),
                ),
        );
      },
    );
  }

  int _getQtyPoints(double width, EcgSummary summary) =>
      (width * (summary?.frequency ?? 0)).round();
}
