import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/models/chart_data_fragment_model.dart';

class EcgPainter extends CustomPainter {
  final ChartsData _chartsData;
  Paint _chartPaint;
  Paint _boxPaint;
  TextPainter _idPainter;

  var _max = double.negativeInfinity;
  var _min = double.infinity;

  EcgPainter(this._chartsData) {
    _initPaint();
    _findBounds();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(_generatePath(size), _chartPaint);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), _boxPaint);
    _idPainter.paint(
        canvas, Offset(size.width - _idPainter.width - 4, size.height - 16));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  void _initPaint() {
    _chartPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    _boxPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    _idPainter = TextPainter()
      ..text = TextSpan(
          text: _chartsData.id,
          style: new TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ))
      ..textDirection = TextDirection.ltr
      ..textAlign = TextAlign.center
      ..layout();
  }

  void _findBounds() {
    _chartsData.chartData.forEach((data) {
      if (data.value > _max) {
        _max = data.value;
      }
      if (data.value < _min) {
        _min = data.value;
      }
    });
  }

  Path _generatePath(Size size) {
    final xOffset = size.width / _chartsData.chartData.length;
    var i = 0;

    final points = _chartsData.chartData
        .map<Offset>((data) => Offset(xOffset * ++i,
            (size.height - 32) * (data.value - _max) / (_min - _max) + 16))
        .toList();

    return Path()..addPolygon(points, false);
  }
}
