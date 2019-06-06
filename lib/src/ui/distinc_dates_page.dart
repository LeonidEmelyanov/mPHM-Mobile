import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mphm_mobile/src/blocs/distinct_date_info_bloc.dart';
import 'package:mphm_mobile/src/blocs/patient_distinct_dates_bloc.dart';
import 'package:mphm_mobile/src/blocs/patient_ecg_bloc.dart';
import 'package:mphm_mobile/src/models/chart_data_fragment_model.dart';
import 'package:mphm_mobile/src/models/data_info_model.dart';
import 'package:mphm_mobile/src/ui/charts_page.dart';
import 'package:mphm_mobile/src/widgets/base_loading_widget.dart';
import 'package:provider/provider.dart';

class DistinctDatesPage extends StatelessWidget {
  final _dateFormat = DateFormat("dd.MM.yyyy");
  final _timeFormat = DateFormat("HH:mm:ss");
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientDistincDatesBloc>(
      builder: (
        BuildContext context,
        PatientDistincDatesBloc bloc,
        Widget child,
      ) =>
          Scaffold(
            appBar: AppBar(
              title: Text("Cardiograms of ${bloc.patient.shortName}"),
            ),
            body: PageView.builder(
              controller: _controller,
              reverse: true,
              itemCount: bloc.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final dataBloc = bloc.data[index];

                if (dataBloc.data == null) {
                  dataBloc.loading();
                }

                return ChangeNotifierProvider<DistinctDateBloc>.value(
                  notifier: dataBloc,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            if (index < bloc.data.length - 1)
                              GestureDetector(
                                child: Icon(Icons.chevron_left),
                                onTap: () => _controller.nextPage(
                                    curve: Curves.ease,
                                    duration: Duration(milliseconds: 300)),
                              ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "${_dateFormat.format(dataBloc.model.date)}",
                                  textScaleFactor: 1.5,
                                ),
                              ),
                            ),
                            if (index > 0)
                              GestureDetector(
                                child: Icon(Icons.chevron_right),
                                onTap: () => _controller.previousPage(
                                    curve: Curves.ease,
                                    duration: Duration(milliseconds: 300)),
                              ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: LoadingWidget<DistinctDateBloc, DataInfoModel>(
                          tilesBuilder: (info) => ListTile(
                                title: Text(
                                    "Statred at ${_timeFormat.format(info.serverTime)}"),
                                subtitle: Text("Total length: ${info.length}"),
                                onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            ChangeNotifierProvider.value(
                                              notifier: PatientEcgBloc(
                                                  patient: bloc.patient,
                                                  date: (dataBloc.model.date
                                                              .millisecondsSinceEpoch /
                                                          1000)
                                                      .round(),
                                                  lead: Leads.All,
                                                  dataId: info.id),
                                              child: ChartsPage(),
                                            ),
                                      ),
                                    ),
                              ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
    );
  }
}
