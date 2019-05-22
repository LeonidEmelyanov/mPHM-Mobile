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
