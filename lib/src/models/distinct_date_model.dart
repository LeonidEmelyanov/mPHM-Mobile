class DistinctDatesModel {
  final List<DistinctDateModel> data;

  DistinctDatesModel.fromJson(Map<String, dynamic> json) : data = json["Data"];
}

class DistinctDateModel {
  final String oDate;
  final int totalTimeSeconds;

  DistinctDateModel.fromJson(Map<String, dynamic> json)
      : oDate = json["ODate"],
        totalTimeSeconds = json["TotalTimeSeconds"];
}
