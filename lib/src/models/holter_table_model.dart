import 'package:mphm_mobile/src/models/data_model.dart';
import 'package:mphm_mobile/src/models/histogram_model.dart';

class HolterTableModel {
  final List<DataModel> data;
  final HistogramModel pausesHistogram;
  final HistogramModel tachycardiasHistogram;

  HolterTableModel.fromJson(Map<String, dynamic> json)
      : data = json["Data"],
        pausesHistogram = json["PausesHistogram"],
        tachycardiasHistogram = json["TachycardiasHistogram"];
}
