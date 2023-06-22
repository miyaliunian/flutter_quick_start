import 'dart:convert';

import 'package:base_module/request/model/response_entity.g.dart';

class ResponseEntity<T> {
  String? status;
  T? data;
  dynamic errors;

  ResponseEntity();

  factory ResponseEntity.fromJson(Map<String, dynamic> json) =>
      $ResponseEntityFromJson<T>(json);

  Map<String, dynamic> toJson() => $ResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
