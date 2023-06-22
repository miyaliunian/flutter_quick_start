import 'dart:convert';

import 'package:base_module/app/modules/station/model/station_entity.g.dart';
import 'package:base_module/generated/json/base/json_field.dart';

@JsonSerializable()
class StationEntity {
  List<StationLocation>? location;
  int? upParkingLots;
  int? parkingLots;
  int? realParkingLots;
  int? reservationCost;
  int? locationCategory;
  int? upWarningDuration;
  int? dutyStatus;
  int? returnCost;
  String? name;
  int? id;
  bool? flagUpCharge;
  int? level;
  int? locationResourceId;
  int? fastFlagCount;
  bool? flagUpParking;
  int? fencePointsId;
  List<StationPictures>? pictures;
  int? realChargeParkingLots;
  int? availableVehicles;
  int? upParkingAmount;
  String? address;
  int? upChargeDuration;

  StationEntity();

  factory StationEntity.fromJson(Map<String, dynamic> json) =>
      $StationEntityFromJson(json);

  Map<String, dynamic> toJson() => $StationEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class StationLocation {
  int? no;
  double? longitude;
  double? latitude;

  StationLocation();

  factory StationLocation.fromJson(Map<String, dynamic> json) =>
      $StationLocationFromJson(json);

  Map<String, dynamic> toJson() => $StationLocationToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class StationPictures {
  int? id;
  String? fileId;
  String? fileUrl;
  dynamic locationDescribe;

  StationPictures();

  factory StationPictures.fromJson(Map<String, dynamic> json) =>
      $StationPicturesFromJson(json);

  Map<String, dynamic> toJson() => $StationPicturesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
