import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/charts_bloc.dart';
import 'package:provider/provider.dart';

class ChartsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<ChartsBloc>(
        builder: (BuildContext _, ChartsBloc bloc, Widget __) => Scaffold(
              appBar: AppBar(
                title: Text("Cardiogram of ${bloc.patient.shortName}"),
              ),
              body: bloc.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: Text(
                          "QtyPoints: ${bloc.data.qtyPoints} with Frequency: ${bloc.data.frequency}"),
                    ),
            ),
      );
}
