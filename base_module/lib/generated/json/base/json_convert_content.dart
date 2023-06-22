import 'package:flutter/material.dart' show debugPrint;
import 'package:base_module/app/modules/station/model/station_entity.dart';

JsonConvert jsonConvert = JsonConvert();
typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);

class JsonConvert {
  static final Map<String, JsonConvertFunction> convertFuncMap = {
    (StationEntity).toString(): StationEntity.fromJson,
    (StationLocation).toString(): StationLocation.fromJson,
    (StationPictures).toString(): StationPictures.fromJson,
  };

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value
          .map((dynamic e) => _asT<T>(e, enumConvert: enumConvert))
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>)
          .map((dynamic e) => _asT<T>(e, enumConvert: enumConvert)!)
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        return convertFuncMap[type]!(Map<String, dynamic>.from(value)) as T;
      } else {
        throw UnimplementedError('$type unimplemented');
      }
    }
  }

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
    // if (<StationEntity>[] is M) {
    //   return data
    //       .map<StationEntity>(
    //           (Map<String, dynamic> e) => StationEntity.fromJson(e))
    //       .toList() as M;
    // }
    // if (<StationLocation>[] is M) {
    //   return data
    //       .map<StationLocation>(
    //           (Map<String, dynamic> e) => StationLocation.fromJson(e))
    //       .toList() as M;
    // }
    // if (<StationPictures>[] is M) {
    //   return data
    //       .map<StationPictures>(
    //           (Map<String, dynamic> e) => StationPictures.fromJson(e))
    //       .toList() as M;
    // }

    debugPrint("${M.toString()} not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json is List) {
      return _getListChildType<M>(
          json.map((e) => e as Map<String, dynamic>).toList());
    } else {
      return jsonConvert.convert<M>(json);
    }
  }
}
