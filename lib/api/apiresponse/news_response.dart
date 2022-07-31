/**
 * Created by : Ayush Kumar
 * Created on : 30-07-2022
 */
import 'package:frentic/models/News.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  /// The generated code assumes these values exist in JSON.
  final String code;
  final String status;
  final String result;
  final List<News> data;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.

  NewsResponse({
    required this.code,
    required this.status,
    required this.result,
    required this.data,
  });

  /// Connect the generated [_$NewsResponseFromJson] function to the `fromJson`
  /// factory.
  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  /// Connect the generated [_$NewsResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
