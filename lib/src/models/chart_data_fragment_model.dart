import 'package:mphm_mobile/src/models/data_by_lead_model.dart';

class ChartDataFragmentModel {
  final List<DataByLeadModel> dataByLeads;
  final int maxFragments;
  final int qtyLeads;
  final int nextDataId;
  final int prevDataId;
  final int nextStartPoint;
  final int prevStartPoint;
  final bool hasNextData;

  ChartDataFragmentModel.json(Map<String, dynamic> json)
      : dataByLeads = json["DataByLeads"],
        maxFragments = json["MaxFragments"],
        qtyLeads = json["QtyLeads"],
        nextDataId = json["NextDataId"],
        prevDataId = json["PrevDataId"],
        nextStartPoint = json["NextStartPoint"],
        prevStartPoint = json["PrevStartPoint"],
        hasNextData = json["HasNextData"];
}
