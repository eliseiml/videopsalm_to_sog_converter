import 'package:json_annotation/json_annotation.dart';

part 'song_verse.g.dart';

@JsonSerializable(createToJson: false)
class SongVerse {
  @JsonKey(name: 'ID')
  final int? id;

  @JsonKey(name: 'Tag')
  final int? tag;

  @JsonKey(name: 'Text', defaultValue: '')
  final String text;

  SongVerse({required this.id, required this.tag, required this.text});

  factory SongVerse.fromJson(Map<String, dynamic> json) =>
      _$SongVerseFromJson(json);
}
