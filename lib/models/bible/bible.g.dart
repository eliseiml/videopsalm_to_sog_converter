// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bible.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bible _$BibleFromJson(Map<String, dynamic> json) => Bible(
      language: json['Language'] as String?,
      title: json['Text'] as String? ?? '',
      testaments: (json['Testaments'] as List<dynamic>?)
              ?.map((e) => Testament.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
