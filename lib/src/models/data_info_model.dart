class DataInfoModel {
  final int age;
  final int id;
  final String patient;
  final String serverTime;
  final int timeSeconds;

  DataInfoModel.fromJson(Map<String, dynamic> json)
      : age = json["Age"],
        id = json["Id"],
        patient = json["Patient"],
        serverTime = json["ServerTime"],
        timeSeconds = json["TimeSeconds"];
}
