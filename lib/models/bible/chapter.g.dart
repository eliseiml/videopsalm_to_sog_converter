// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      id: json['ID'] as int?,
      title: json['Text'] as String? ?? '',
      verses: (json['Verses'] as List<dynamic>?)
              ?.map((e) => BibleVerse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
