class Doctor {
  final int id;
  final String name0;
  final String name1;
  final String name2;

  Doctor(this.id, this.name0, this.name1, this.name2);

  Doctor.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name0 = json["name0"],
        name1 = json["name1"],
        name2 = json["name2"];
}
