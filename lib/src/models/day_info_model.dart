class DayInfoModel {
  final int day;
  final int month;
  final int year;
  final int patientId;

  DayInfoModel.fromJson(Map<String, dynamic> json)
      : day = json["Day"],
        month = json["Month"],
        year = json["Year"],
        patientId = json["PatientId"];
}
