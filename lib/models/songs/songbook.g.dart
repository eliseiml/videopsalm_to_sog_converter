// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songbook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Songbook _$SongbookFromJson(Map<String, dynamic> json) => Songbook(
      description: json['Description'] as String? ?? '',
      title: json['Text'] as String? ?? '',
      songs: (json['Songs'] as List<dynamic>?)
              ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
