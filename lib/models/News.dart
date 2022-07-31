/**
 * Created by : Ayush Kumar
 * Created on : 30-07-2022
 */
import 'package:json_annotation/json_annotation.dart';

part 'News.g.dart';

@JsonSerializable()
class News {
  /// The generated code assumes these values exist in JSON.
  final String id, author;
  final String title;
  final String f_image;
  final String content;
  final String date;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.

  News({
    required this.id,
    required this.author,
    required this.title,
    required this.f_image,
    required this.content,
    required this.date,
  });

  String get img => "https://newsmytra.com/assets/featured-image/$f_image";

  DateTime get dateTime => DateTime.parse(date);

  /// Connect the generated [_$NewsFromJson] function to the `fromJson`
  /// factory.
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  /// Connect the generated [_$NewsToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
