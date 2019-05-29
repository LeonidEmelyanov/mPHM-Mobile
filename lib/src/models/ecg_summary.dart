class EcgSummary {
  final int frequency;
  final int qtyPoints;

  EcgSummary.fromJson(Map<String, dynamic> json)
      : frequency = json["Frequency"],
        qtyPoints = json["QtyPoints"];
}
