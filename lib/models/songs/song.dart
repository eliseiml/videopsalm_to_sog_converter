import 'package:json_annotation/json_annotation.dart';

import 'song_verse.dart';

part 'song.g.dart';

@JsonSerializable(createToJson: false)
class Song {
  @JsonKey(name: 'ID', defaultValue: 0)
  final int id;

  @JsonKey(name: 'Text', defaultValue: '')
  final String title;

  @JsonKey(name: 'Key', defaultValue: '')
  final String key;

  @JsonKey(name: 'Verses', defaultValue: [])
  final List<SongVerse> verses;

  Song({
    required this.id,
    required this.title,
    required this.key,
    required this.verses,
  });

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}
