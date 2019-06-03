class DataByLeadModel {
  final int initPoint;
  final String leadName;
  final String base64ByteData;

  DataByLeadModel.fromJson(Map<String, dynamic> json)
      : initPoint = json["InitPoint"],
        leadName = json["LeadName"],
        base64ByteData = json["Base64ByteData"];
}

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
      : dataByLeads = json["DataByLeads"]
            .map<DataByLeadModel>((item) => DataByLeadModel.fromJson(item))
            .toList(),
        maxFragments = json["MaxFragments"],
        qtyLeads = json["QtyLeads"],
        nextDataId = json["NextDataId"],
        prevDataId = json["PrevDataId"],
        nextStartPoint = json["NextStartPoint"],
        prevStartPoint = json["PrevStartPoint"],
        hasNextData = json["HasNextData"];
}

class ChartData {
  final double seconds;
  final double value;

  ChartData(this.seconds, this.value);
}

enum Leads {
  All,
  I,
  II,
  V1,
  V2,
  V3,
  V4,
  V5,
  V6,
}
