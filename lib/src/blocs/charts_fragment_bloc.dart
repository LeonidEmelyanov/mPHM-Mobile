import 'dart:convert';
import 'dart:typed_data';

import 'package:mphm_mobile/src/blocs/base_bloc.dart';
import 'package:mphm_mobile/src/models/chart_data_fragment_model.dart';

class ChartsFragmentBloc extends BaseBloc<Map<String, List<ChartData>>> {
  final int patientId;
  final int dataId;
  final String selectedLead;
  final int startPoint;
  final int qtyPoints;
  final int frequency;

  ChartsFragmentBloc({
    this.patientId,
    this.dataId,
    this.selectedLead,
    this.startPoint,
    this.qtyPoints,
    this.frequency,
  });

  @override
  Future<Map<String, List<ChartData>>> getData(bool reload) async {
    return await _fetchChartData(await repository.getChartDataFragment(
        patientId, dataId, selectedLead, startPoint, qtyPoints, reload));
  }

  Future<Map<String, List<ChartData>>> _fetchChartData(
          ChartDataFragmentModel model) async =>
      Map.fromIterable(model.dataByLeads,
          key: (v) => v.leadName, value: (v) => _parse(v.base64ByteData));

  List<ChartData> _parse(String base64ByteData) {
    final buffer = Int8List.fromList(base64.decode(base64ByteData)).buffer;

    return List.generate(
        (buffer.lengthInBytes / 4).round(),
        (offset) => ChartData((startPoint + offset) / frequency,
            ByteData.view(buffer).getFloat32(offset * 4, Endian.little)));
  }
}
