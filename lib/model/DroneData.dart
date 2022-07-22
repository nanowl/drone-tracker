import 'package:json_annotation/json_annotation.dart';

part 'DroneData.g.dart';

@JsonSerializable()
class DroneData {
  int logNum;
  String droneid;
  double lat;
  double lng;
  DateTime time;

  DroneData({
    required this.logNum,
    required this.droneid,
    required this.lat,
    required this.lng,
    required this. time
  });

  factory DroneData.fromJson(Map<String, dynamic> json) => _$DroneDataFromJson(json);

  Map<String, dynamic> toJson() => _$DroneDataToJson(this);
}