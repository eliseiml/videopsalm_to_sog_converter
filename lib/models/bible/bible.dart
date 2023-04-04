import 'package:json_annotation/json_annotation.dart';
import 'testament.dart';

part 'bible.g.dart';

@JsonSerializable(createToJson: false)
class Bible {
  @JsonKey(name: 'Language')
  final String? language;

  @JsonKey(name: 'Text', defaultValue: '')
  final String title;

  @JsonKey(name: 'Testaments', defaultValue: [])
  final List<Testament> testaments;

  Bible({
    required this.language,
    required this.title,
    required this.testaments,
  });

  factory Bible.fromJson(Map<String, dynamic> json) => _$BibleFromJson(json);
}
