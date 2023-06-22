import '../../generated/json/base/json_convert_content.dart';
import 'response_entity.dart';

ResponseEntity<T> $ResponseEntityFromJson<T>(Map<String, dynamic> json) {
  final ResponseEntity<T> responseEntity = ResponseEntity<T>();
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    responseEntity.status = status;
  }
  final T? data = jsonConvert.convert<T>(json['data']);
  if (data != null) {
    responseEntity.data = data;
  }

  final dynamic errors = jsonConvert.convert<dynamic>(json['errors']);
  if (errors != null) {
    responseEntity.errors = errors;
  }
  return responseEntity;
}

Map<String, dynamic> $ResponseEntityToJson(ResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['data'] = entity.data;
  data['errors'] = entity.errors;
  return data;
}
