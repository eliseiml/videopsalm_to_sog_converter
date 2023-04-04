import 'package:json_annotation/json_annotation.dart';

part 'bible_verse.g.dart';

@JsonSerializable(createToJson: false)
class BibleVerse {
  @JsonKey(name: 'ID')
  final int? id;

  @JsonKey(name: 'Text', defaultValue: '')
  final String text;

  BibleVerse({
    required this.id,
    required this.text,
  });

  factory BibleVerse.fromJson(Map<String, dynamic> json) =>
      _$BibleVerseFromJson(json);
}
