class DataInfoModel {
  final int age;
  final int id;
  final String patient;
  final DateTime serverTime;
  final Duration timeSeconds;

  get length {
    var s = timeSeconds.toString();
    return s.substring(0, s.indexOf('.'));
  }

  DataInfoModel.fromJson(Map<String, dynamic> json)
      : age = json["Age"],
        id = json["Id"],
        patient = json["Patient"],
        serverTime = DateTime.parse("${json["ServerTime"]}Z"),
        timeSeconds = Duration(seconds: json["TimeSeconds"]);
}
