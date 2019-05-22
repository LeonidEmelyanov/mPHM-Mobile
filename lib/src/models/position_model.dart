class PositionModel {
  final int dataId;
  final int position;
  final double extra;

  PositionModel.fromJson(Map<String, dynamic> json)
      : dataId = json["DataId"],
        position = json["Position"],
        extra = json["Extra"];
}
