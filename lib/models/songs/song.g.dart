// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
      id: json['ID'] as int? ?? 0,
      title: json['Text'] as String? ?? '',
      key: json['Key'] as String? ?? '',
      verses: (json['Verses'] as List<dynamic>?)
              ?.map((e) => SongVerse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
