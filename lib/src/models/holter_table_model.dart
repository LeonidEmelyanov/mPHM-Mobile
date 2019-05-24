class HistogramModel {
  final List<int> histQtys;
  final List<double> hist;
  final double min;
  final double max;
  final double step;

  HistogramModel.fromJson(Map<String, dynamic> json)
      : histQtys = json["histQtys"],
        hist = json["Hist"],
        min = json["Min"],
        max = json["Max"],
        step = json["Step"];
}

class PositionModel {
  final int dataId;
  final int position;
  final double extra;

  PositionModel.fromJson(Map<String, dynamic> json)
      : dataId = json["DataId"],
        position = json["Position"],
        extra = json["Extra"];
}

class HolterPointDescriptionModel {
  final String pointName;
  final int count;
  final List<PositionModel> positions;

  HolterPointDescriptionModel.fromJson(Map<String, dynamic> json)
      : pointName = json["PointName"],
        count = json["Count"],
        positions = json["Positions"];
}

class DataModel {
  final String startHour;
  final int minHr;
  final int hR;
  final int maxHr;
  final List<HolterPointDescriptionModel> holterPointDescriptions;
  final String hourString;

  DataModel.fromJson(Map<String, dynamic> json)
      : startHour = json["StartHour"],
        minHr = json["MinHR"],
        hR = json["HR"],
        maxHr = json["MaxHR"],
        holterPointDescriptions = json["HolterPointDescriptions"],
        hourString = json["HourString"];
}

class HolterTableModel {
  final List<DataModel> data;
  final HistogramModel pausesHistogram;
  final HistogramModel tachycardiasHistogram;

  HolterTableModel.fromJson(Map<String, dynamic> json)
      : data = json["Data"],
        pausesHistogram = json["PausesHistogram"],
        tachycardiasHistogram = json["TachycardiasHistogram"];
}
