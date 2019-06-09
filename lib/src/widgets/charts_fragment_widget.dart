import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/charts_fragment_bloc.dart';
import 'package:mphm_mobile/src/models/chart_data_fragment_model.dart';
import 'package:mphm_mobile/src/widgets/base_loading_widget.dart';
import 'package:mphm_mobile/src/widgets/ecg_painter.dart';

class ChartsFragmentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      LoadingWidget<ChartsFragmentBloc, ChartsData>(
        tilesBuilder: (item) => Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: SizedBox(
                child: CustomPaint(
                  foregroundPainter: EcgPainter(item),
                ),
                width: double.infinity,
                height: 128,
              ),
            ),
      );
}
