import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:mphm_mobile/src/blocs/base_bloc.dart';
import 'package:mphm_mobile/src/models/chart_data_fragment_model.dart';

class ChartsFragmentBloc extends BaseBloc<List<ChartsData>> {
  final int patientId;
  final int date;
  final int dataId;
  final String selectedLead;
  final int startPoint;
  final int qtyPoints;
  final int frequency;

  ChartsFragmentBloc({
    @required this.patientId,
    @required this.date,
    @required this.dataId,
    @required this.selectedLead,
    @required this.startPoint,
    @required this.qtyPoints,
    @required this.frequency,
  }) {
    loading();
  }

  @override
  Future<List<ChartsData>> getData(bool reload) async =>
      await _fetchChartData(await repository.getChartDataFragment(
        patientId,
        date,
        dataId,
        selectedLead,
        startPoint,
        qtyPoints,
        reload,
      ));

  Future<List<ChartsData>> _fetchChartData(
          ChartDataFragmentModel model) async =>
      model.dataByLeads
          .map<ChartsData>((data) => ChartsData(
                id: data.leadName,
                chartData: _parse(data.base64ByteData),
              ))
          .toList()
            ..sort((left, right) => left.id.compareTo(right.id));

  List<ChartData> _parse(String base64ByteData) {
    final buffer = Int8List.fromList(base64.decode(base64ByteData)).buffer;

    return List.generate(
        (buffer.lengthInBytes / 4).round(),
        (offset) => ChartData(
              (startPoint + offset) / frequency,
              (ByteData.view(buffer).getFloat32(offset * 4, Endian.little)),
            ));
  }
}
