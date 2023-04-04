import 'package:json_annotation/json_annotation.dart';
import 'bible_verse.dart';

part 'chapter.g.dart';

@JsonSerializable(createToJson: false)
class Chapter {
  @JsonKey(name: 'ID')
  final int? id;

  @JsonKey(name: 'Text', defaultValue: '')
  final String title;

  @JsonKey(name: 'Verses', defaultValue: [])
  final List<BibleVerse> verses;

  Chapter({
    required this.id,
    required this.title,
    required this.verses,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);
}
