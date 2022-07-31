/**
 * Created by : Ayush Kumar
 * Created on : 30-07-2022
 */
import 'package:frentic/api/apiresponse/campaign_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse<ResponseType> {
  /// The generated code assumes these values exist in JSON.
  final int error_code;
  final String response_string;
  @_Converter()
  final List<ResponseType>? data;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.

  BaseResponse({
    required this.error_code,
    required this.response_string,
    required this.data,
  });

  /// Connect the generated [_$BaseResponseFromJson] function to the `fromJson`
  /// factory.
  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  /// Connect the generated [_$BaseResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object?> {
  const _Converter();

  @override
  T fromJson(Object? json) {
    switch (T) {
      case CampaignResponse:
        return CampaignResponse.fromJson(json as Map<String, dynamic>) as T;
      default:
        throw UnsupportedError('Unsupported type: $T');
    }
  }

  @override
  Object? toJson(T object) => object;
}
