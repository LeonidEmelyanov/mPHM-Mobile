import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/charts_fragment_bloc.dart';
import 'package:mphm_mobile/src/models/chart_data_fragment_model.dart';
import 'package:mphm_mobile/src/widgets/base_loading_widget.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartsFragmentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      LoadingWidget<ChartsFragmentBloc, Map<String, List<ChartData>>>(
        tilesBuilder: (item) => charts.LineChart(item.entries
            .map<charts.Series<double, double>>(
                (data) => charts.Series<double, double>())
            .toList()),
      );
}
