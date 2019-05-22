import 'package:mphm_mobile/src/models/position_model.dart';

class HolterPointDescriptionModel {
  final String pointName;
  final int count;
  final List<PositionModel> positions;

  HolterPointDescriptionModel.fromJson(Map<String, dynamic> json)
      : pointName = json["PointName"],
        count = json["Count"],
        positions = json["Positions"];
}
