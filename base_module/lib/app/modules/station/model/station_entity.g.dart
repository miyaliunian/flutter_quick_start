import 'package:base_module/app/modules/station/model/station_entity.dart';
import 'package:base_module/generated/json/base/json_convert_content.dart';

StationEntity $StationEntityFromJson(Map<String, dynamic> json) {
  final StationEntity stationEntity = StationEntity();
  final List<StationLocation>? location =
      jsonConvert.convertListNotNull<StationLocation>(json['location']);
  if (location != null) {
    stationEntity.location = location;
  }
  final int? upParkingLots = jsonConvert.convert<int>(json['upParkingLots']);
  if (upParkingLots != null) {
    stationEntity.upParkingLots = upParkingLots;
  }
  final int? parkingLots = jsonConvert.convert<int>(json['parkingLots']);
  if (parkingLots != null) {
    stationEntity.parkingLots = parkingLots;
  }
  final int? realParkingLots =
      jsonConvert.convert<int>(json['realParkingLots']);
  if (realParkingLots != null) {
    stationEntity.realParkingLots = realParkingLots;
  }
  final int? reservationCost =
      jsonConvert.convert<int>(json['reservationCost']);
  if (reservationCost != null) {
    stationEntity.reservationCost = reservationCost;
  }
  final int? locationCategory =
      jsonConvert.convert<int>(json['locationCategory']);
  if (locationCategory != null) {
    stationEntity.locationCategory = locationCategory;
  }
  final int? upWarningDuration =
      jsonConvert.convert<int>(json['upWarningDuration']);
  if (upWarningDuration != null) {
    stationEntity.upWarningDuration = upWarningDuration;
  }
  final int? dutyStatus = jsonConvert.convert<int>(json['dutyStatus']);
  if (dutyStatus != null) {
    stationEntity.dutyStatus = dutyStatus;
  }
  final int? returnCost = jsonConvert.convert<int>(json['returnCost']);
  if (returnCost != null) {
    stationEntity.returnCost = returnCost;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    stationEntity.name = name;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    stationEntity.id = id;
  }
  final bool? flagUpCharge = jsonConvert.convert<bool>(json['flagUpCharge']);
  if (flagUpCharge != null) {
    stationEntity.flagUpCharge = flagUpCharge;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    stationEntity.level = level;
  }
  final int? locationResourceId =
      jsonConvert.convert<int>(json['locationResourceId']);
  if (locationResourceId != null) {
    stationEntity.locationResourceId = locationResourceId;
  }
  final int? fastFlagCount = jsonConvert.convert<int>(json['fastFlagCount']);
  if (fastFlagCount != null) {
    stationEntity.fastFlagCount = fastFlagCount;
  }
  final bool? flagUpParking = jsonConvert.convert<bool>(json['flagUpParking']);
  if (flagUpParking != null) {
    stationEntity.flagUpParking = flagUpParking;
  }
  final int? fencePointsId = jsonConvert.convert<int>(json['fencePointsId']);
  if (fencePointsId != null) {
    stationEntity.fencePointsId = fencePointsId;
  }
  final List<StationPictures>? pictures =
      jsonConvert.convertListNotNull<StationPictures>(json['pictures']);
  if (pictures != null) {
    stationEntity.pictures = pictures;
  }
  final int? realChargeParkingLots =
      jsonConvert.convert<int>(json['realChargeParkingLots']);
  if (realChargeParkingLots != null) {
    stationEntity.realChargeParkingLots = realChargeParkingLots;
  }
  final int? availableVehicles =
      jsonConvert.convert<int>(json['availableVehicles']);
  if (availableVehicles != null) {
    stationEntity.availableVehicles = availableVehicles;
  }
  final int? upParkingAmount =
      jsonConvert.convert<int>(json['upParkingAmount']);
  if (upParkingAmount != null) {
    stationEntity.upParkingAmount = upParkingAmount;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    stationEntity.address = address;
  }
  final int? upChargeDuration =
      jsonConvert.convert<int>(json['upChargeDuration']);
  if (upChargeDuration != null) {
    stationEntity.upChargeDuration = upChargeDuration;
  }
  return stationEntity;
}

Map<String, dynamic> $StationEntityToJson(StationEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['location'] = entity.location?.map((v) => v.toJson()).toList();
  data['upParkingLots'] = entity.upParkingLots;
  data['parkingLots'] = entity.parkingLots;
  data['realParkingLots'] = entity.realParkingLots;
  data['reservationCost'] = entity.reservationCost;
  data['locationCategory'] = entity.locationCategory;
  data['upWarningDuration'] = entity.upWarningDuration;
  data['dutyStatus'] = entity.dutyStatus;
  data['returnCost'] = entity.returnCost;
  data['name'] = entity.name;
  data['id'] = entity.id;
  data['flagUpCharge'] = entity.flagUpCharge;
  data['level'] = entity.level;
  data['locationResourceId'] = entity.locationResourceId;
  data['fastFlagCount'] = entity.fastFlagCount;
  data['flagUpParking'] = entity.flagUpParking;
  data['fencePointsId'] = entity.fencePointsId;
  data['pictures'] = entity.pictures?.map((v) => v.toJson()).toList();
  data['realChargeParkingLots'] = entity.realChargeParkingLots;
  data['availableVehicles'] = entity.availableVehicles;
  data['upParkingAmount'] = entity.upParkingAmount;
  data['address'] = entity.address;
  data['upChargeDuration'] = entity.upChargeDuration;
  return data;
}

StationLocation $StationLocationFromJson(Map<String, dynamic> json) {
  final StationLocation stationLocation = StationLocation();
  final int? no = jsonConvert.convert<int>(json['no']);
  if (no != null) {
    stationLocation.no = no;
  }
  final double? longitude = jsonConvert.convert<double>(json['longitude']);
  if (longitude != null) {
    stationLocation.longitude = longitude;
  }
  final double? latitude = jsonConvert.convert<double>(json['latitude']);
  if (latitude != null) {
    stationLocation.latitude = latitude;
  }
  return stationLocation;
}

Map<String, dynamic> $StationLocationToJson(StationLocation entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['no'] = entity.no;
  data['longitude'] = entity.longitude;
  data['latitude'] = entity.latitude;
  return data;
}

StationPictures $StationPicturesFromJson(Map<String, dynamic> json) {
  final StationPictures stationPictures = StationPictures();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    stationPictures.id = id;
  }
  final String? fileId = jsonConvert.convert<String>(json['fileId']);
  if (fileId != null) {
    stationPictures.fileId = fileId;
  }
  final String? fileUrl = jsonConvert.convert<String>(json['fileUrl']);
  if (fileUrl != null) {
    stationPictures.fileUrl = fileUrl;
  }
  final dynamic locationDescribe =
      jsonConvert.convert<dynamic>(json['locationDescribe']);
  if (locationDescribe != null) {
    stationPictures.locationDescribe = locationDescribe;
  }
  return stationPictures;
}

Map<String, dynamic> $StationPicturesToJson(StationPictures entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['fileId'] = entity.fileId;
  data['fileUrl'] = entity.fileUrl;
  data['locationDescribe'] = entity.locationDescribe;
  return data;
}
