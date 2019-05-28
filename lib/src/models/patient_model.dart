class PatientModel {
  final int id;
  final String name;
  final String surname;
  final String lastname;
  final String birthday;
  final int age;

  get fullName => "$surname $name $lastname";
  get shortName =>
      "$surname ${name.substring(0, 1)}." +
      (lastname.length > 0 ? " ${lastname.substring(0, 1)}." : "");

  PatientModel.fromJson(Map<String, dynamic> json)
      : id = json["Id"],
        name = json["Name1"],
        surname = json["Name0"],
        lastname = json["Name2"],
        birthday = json["Birthday"],
        age = json["Age"];
}
