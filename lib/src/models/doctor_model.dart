class DoctorModel {
  final int id;
  final String name;
  final String surname;
  final String lastname;

  DoctorModel.fromJson(Map<String, dynamic> json)
      : id = json["Id"],
        name = json["Name1"],
        surname = json["Name0"],
        lastname = json["Name2"];
}
