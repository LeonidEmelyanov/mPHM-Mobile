import 'package:mphm_mobile/src/models/holter_point_description.dart';

class DataModel {
  final String startHour;
  final int minHr;
  final int hR;
  final int maxHr;
  final List<HolterPointDescriptionModel> holterPointDescriptions;
  final String hourString;

  DataModel.fromJson(Map<String, dynamic> json)
      : startHour = json["StartHour"],
        minHr = json["MinHR"],
        hR = json["HR"],
        maxHr = json["MaxHR"],
        holterPointDescriptions = json["HolterPointDescriptions"],
        hourString = json["HourString"];
}
