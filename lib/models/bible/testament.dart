import 'package:json_annotation/json_annotation.dart';
import 'book.dart';

part 'testament.g.dart';

@JsonSerializable(createToJson: false)
class Testament {
  @JsonKey(name: 'ID')
  final int? id;

  @JsonKey(name: 'Text', defaultValue: '')
  final String text;

  @JsonKey(name: 'Books', defaultValue: [])
  final List<Book> books;

  Testament({
    required this.id,
    required this.text,
    required this.books,
  });

  factory Testament.fromJson(Map<String, dynamic> json) =>
      _$TestamentFromJson(json);
}
