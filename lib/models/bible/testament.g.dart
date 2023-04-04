// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testament.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Testament _$TestamentFromJson(Map<String, dynamic> json) => Testament(
      id: json['ID'] as int?,
      text: json['Text'] as String? ?? '',
      books: (json['Books'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
