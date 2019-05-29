class DataInfoModel {
  final int id;
  final DateTime serverTime;
  final Duration timeSeconds;

  get length {
    var s = timeSeconds.toString();
    return s.substring(0, s.indexOf('.'));
  }

  DataInfoModel.fromJson(Map<String, dynamic> json)
      : id = json["Id"],
        serverTime = DateTime.parse("${json["ServerTime"]}Z"),
        timeSeconds = Duration(seconds: json["TimeSeconds"]);
}
