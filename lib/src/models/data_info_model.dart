class DataInfoModel {
  final int age;
  final int id;
  final String patient;
  final DateTime serverTime;
  final Duration timeSeconds;

  DataInfoModel.fromJson(Map<String, dynamic> json)
      : age = json["Age"],
        id = json["Id"],
        patient = json["Patient"],
        serverTime = DateTime.parse(json["ServerTime"]),
        timeSeconds = Duration(seconds: json["TimeSeconds"]);
}
