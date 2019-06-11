import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/charts_fragment_bloc.dart';
import 'package:mphm_mobile/src/models/chart_data_fragment_model.dart';
import 'package:mphm_mobile/src/widgets/base_loading_widget.dart';
import 'package:mphm_mobile/src/widgets/ecg_painter.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class ChartsFragmentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      LoadingWidget<ChartsFragmentBloc, ChartsData>(
        tilesBuilder: (item) => Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: SizedBox(
                //   child: charts.LineChart(
                //     <charts.Series<ChartData, double>>[
                //       charts.Series<ChartData, double>(
                //         id: item.id,
                //         data: item.chartData,
                //         domainFn: (ChartData data, _) => data.seconds,
                //         measureFn: (ChartData data, _) => data.value,
                //       ),
                //     ],
                //     domainAxis: charts.NumericAxisSpec(
                //       tickProviderSpec:
                //           charts.BasicNumericTickProviderSpec(zeroBound: false),
                //     ),
                //     primaryMeasureAxis: charts.NumericAxisSpec(
                //       tickProviderSpec: charts.StaticNumericTickProviderSpec(
                //         <charts.TickSpec<num>>[
                //           charts.TickSpec<num>(item.min),
                //           charts.TickSpec<num>(item.max),
                //         ],
                //       ),
                //     ),
                //   ),
                child: RepaintBoundary(
                  child: CustomPaint(
                    painter: EcgPainter(item),
                    isComplex: true,
                    willChange: false,
                  ),
                ),
                width: double.infinity,
                height: 128,
              ),
            ),
      );
}
