import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/charts_fragment_bloc.dart';
import 'package:mphm_mobile/src/models/chart_data_fragment_model.dart';
import 'package:mphm_mobile/src/widgets/base_loading_widget.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartsFragmentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      LoadingWidget<ChartsFragmentBloc, ChartsData>(
        tilesBuilder: (item) => SizedBox(
              child: charts.LineChart(
                <charts.Series<ChartData, double>>[
                  charts.Series<ChartData, double>(
                    id: item.id,
                    data: item.chartData,
                    colorFn: (_, __) =>
                        charts.MaterialPalette.blue.shadeDefault,
                    domainFn: (ChartData value, _) => value.seconds,
                    measureFn: (ChartData value, _) => value.value,
                  )
                ],
              ),
              width: double.infinity,
              height: 128,
            ),
      );
}
