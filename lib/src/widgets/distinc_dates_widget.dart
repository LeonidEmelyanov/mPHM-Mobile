import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/patient_distinct_dates_bloc.dart';
import 'package:mphm_mobile/src/models/distinct_date_model.dart';
import 'package:mphm_mobile/src/widgets/base_loading_widget.dart';
import 'package:provider/provider.dart';

class DistinctDatesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PatientDistincDatesBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Cardiogram of ${bloc.patient.surname} ${bloc.patient.name.substring(0, 1)}."),
      ),
      body: LoadingWidget<DistinctDateModel>(
        bloc: bloc,
        listTiles: (item) => ListTile(
              title: Text("Started at: ${item.date}"),
              subtitle: Text("Total length ${item.total}"),
              leading: Icon(
                Icons.account_circle,
                size: 40,
              ),
            ),
      ),
    );
  }
}
