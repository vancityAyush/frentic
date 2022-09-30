// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'News.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      id: json['id'] as String,
      author: json['author'] as String,
      title: json['title'] as String,
      f_image: json['f_image'] as String,
      content: json['content'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'title': instance.title,
      'f_image': instance.f_image,
      'content': instance.content,
      'date': instance.date,
    };
