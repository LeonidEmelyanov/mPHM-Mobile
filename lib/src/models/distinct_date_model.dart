class DistinctDateModel {
  final DateTime date;
  final Duration total;

  DistinctDateModel.fromJson(Map<String, dynamic> json)
      : date = DateTime.parse(json["ODate"]),
        total = Duration(seconds: json["TotalTimeSeconds"]);
}
