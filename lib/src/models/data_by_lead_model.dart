class DataByLeadModel {
  final int initPoint;
  final String leadName;
  final String base64ByteData;

  DataByLeadModel.fromJson(Map<String, dynamic> json)
      : initPoint = json["InitPoint"],
        leadName = json["LeadName"],
        base64ByteData = json["Base64ByteData"];
}
