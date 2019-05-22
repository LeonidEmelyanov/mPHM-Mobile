class Patient {
  final int id;
  final String name;
  final String surname;
  final String lastname;
  final String birthday;
  final int age;

  Patient.fromJson(Map<String, dynamic> json)
      : id = json["Id"],
        name = json["Name1"],
        surname = json["Name0"],
        lastname = json["Name2"],
        birthday = json["Birthday"],
        age = json["Age"];
}
