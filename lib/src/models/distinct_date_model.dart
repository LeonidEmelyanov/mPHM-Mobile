class DistinctDateModel {
  final DateTime date;
  final Duration total;

  get length {
    var s = total.toString();
    return s.substring(0, s.indexOf('.') - 1);
  }

  DistinctDateModel.fromJson(Map<String, dynamic> json)
      : date = DateTime.parse(json["ODate"]),
        total = Duration(seconds: json["TotalTimeSeconds"]);
}
