import 'package:json_annotation/json_annotation.dart';
import 'song.dart';

part 'songbook.g.dart';

@JsonSerializable(createToJson: false)
class Songbook {
  @JsonKey(name: 'Description', defaultValue: '')
  final String description;

  @JsonKey(name: 'Text', defaultValue: '')
  final String title;

  @JsonKey(name: "Songs", defaultValue: [])
  final List<Song> songs;

  Songbook({
    required this.description,
    required this.title,
    required this.songs,
  });

  factory Songbook.fromJson(Map<String, dynamic> json) =>
      _$SongbookFromJson(json);
}
