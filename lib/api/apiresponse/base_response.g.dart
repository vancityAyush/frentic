// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<ResponseType> _$BaseResponseFromJson<ResponseType>(
        Map<String, dynamic> json) =>
    BaseResponse<ResponseType>(
      error_code: json['error_code'] as int,
      response_string: json['response_string'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map(_Converter<ResponseType>().fromJson)
          .toList(),
    );

Map<String, dynamic> _$BaseResponseToJson<ResponseType>(
        BaseResponse<ResponseType> instance) =>
    <String, dynamic>{
      'error_code': instance.error_code,
      'response_string': instance.response_string,
      'data': instance.data?.map(_Converter<ResponseType>().toJson).toList(),
    };
