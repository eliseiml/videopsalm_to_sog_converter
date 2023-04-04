import 'package:json_annotation/json_annotation.dart';
import 'chapter.dart';

part 'book.g.dart';

@JsonSerializable(createToJson: false)
class Book {
  @JsonKey(name: 'ID')
  final int? id;

  @JsonKey(name: 'Text', defaultValue: '')
  final String title;

  @JsonKey(name: 'Chapters', defaultValue: [])
  final List<Chapter> chapters;

  Book({
    required this.id,
    required this.title,
    required this.chapters,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
