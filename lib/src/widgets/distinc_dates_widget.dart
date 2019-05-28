import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mphm_mobile/src/blocs/distinct_date_info_bloc.dart';
import 'package:mphm_mobile/src/blocs/patient_distinct_dates_bloc.dart';
import 'package:mphm_mobile/src/widgets/base_loading_widget.dart';
import 'package:provider/provider.dart';

class DistinctDatesWidget extends StatelessWidget {
  final _dateFormat = DateFormat("dd.MM.yyyy");
  final _timeFormat = DateFormat("HH:mm:ss dd.MM.yyyy");

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PatientDistincDatesBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cardiograms of ${bloc.patient.shortName}"),
      ),
      body: LoadingWidget<DistinctDateBloc>(
          bloc: bloc,
          tilesBuilder: (dataBloc) =>
              ChangeNotifierProvider<DistinctDateBloc>.value(
                notifier: dataBloc,
                child: ExpansionTile(
                    key: PageStorageKey<DistinctDateBloc>(dataBloc),
                    title: Text(_dateFormat.format(dataBloc.model.date)),
                    trailing: dataBloc.isLoading
                        ? Container(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(),
                          )
                        : null,
                    children: (dataBloc.data ?? [])
                        .map((dataInfo) => ListTile(
                              title: Text(
                                  "Statred at ${_timeFormat.format(dataInfo.serverTime)}"),
                              subtitle:
                                  Text("Total length: ${dataInfo.timeSeconds}"),
                            ))
                        .toList(),
                    onExpansionChanged: (isExpanded) {
                      if (isExpanded && dataBloc.data == null) {
                        dataBloc.loading();
                      }
                    }),
              )),
    );
  }
}
