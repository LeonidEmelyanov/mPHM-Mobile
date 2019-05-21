class DistinctDates {
  final List<DistinctDate> data;

  DistinctDates.fromJson(Map<String, dynamic> json) : data = json["Data"];
}

class DistinctDate {
  final String oDate;
  final int totalTimeSeconds;

  DistinctDate.fromJson(Map<String, dynamic> json)
      : oDate = json["ODate"],
        totalTimeSeconds = json["TotalTimeSeconds"];
}
