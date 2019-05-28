class DistinctDateModel {
  final DateTime date;
  final Duration total;

  get length {
    var s = total.toString();
    return s.substring(0, s.indexOf('.'));
  }

  DistinctDateModel.fromJson(Map<String, dynamic> json)
      : date = DateTime.parse("${json["ODate"]}Z"),
        total = Duration(seconds: json["TotalTimeSeconds"]);
}
