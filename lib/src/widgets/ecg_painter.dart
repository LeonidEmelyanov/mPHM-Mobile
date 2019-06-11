import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/models/chart_data_fragment_model.dart';

class EcgPainter extends CustomPainter {
  final ChartsData _chartsData;

  Paint _chartPaint;
  Paint _boxPaint;
  Paint _gridPaint;
  TextPainter _idPainter;

  EcgPainter(this._chartsData) {
    _chartPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..isAntiAlias = false
      ..strokeWidth = 1.5;

    _boxPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..isAntiAlias = false;

    _gridPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..isAntiAlias = false;

    _idPainter = TextPainter()
      ..text = TextSpan(
        text: _chartsData.id,
        style: new TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      )
      ..textDirection = TextDirection.ltr
      ..textAlign = TextAlign.center
      ..layout();
  }

  @override
  void paint(Canvas canvas, Size size) {
    // _drawGrid(canvas, size);
    _drawBox(canvas, size);
    _drawId(canvas, size);
    _drawChart(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  void _drawBox(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), _boxPaint);
  }

  void _drawId(Canvas canvas, Size size) {
    _idPainter.paint(
        canvas, Offset(size.width - _idPainter.width - 4, size.height - 16));
  }

  void _drawGrid(Canvas canvas, Size size) {
    final widthMm = size.width / 150 * 2.54 * 10;
    final heightMm = size.height / 150 * 2.54 * 10;

    List.generate(widthMm.round(), (index) {
      final x = size.width / widthMm * index;

      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        _gridPaint,
      );
    });

    List.generate(heightMm.round(), (index) {
      final y = size.height / heightMm * index;

      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        _gridPaint,
      );
    });
  }

  void _drawChart(Canvas canvas, Size size) {
    final xOffset = size.width / _chartsData.chartData.length;
    var i = 0;

    final points = _chartsData.chartData
        .map<Offset>((data) => Offset(
            xOffset * ++i,
            (size.height - 32) *
                    (data.value - _chartsData.max) /
                    (_chartsData.min - _chartsData.max) +
                16))
        .toList();

    canvas.drawPath(Path()..addPolygon(points, false), _chartPaint);
  }
}
