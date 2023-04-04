import 'package:videopsalm_to_sog_converter/models/bible/bible.dart';
import 'package:videopsalm_to_sog_converter/models/bible/bible_verse.dart';
import 'package:videopsalm_to_sog_converter/models/bible/book.dart';

class BibleConverter {
  // SOG template:
  // Genesis	1	1	In the beginning God created the heaven and the earth.
  String convertToSogFormat(Bible bible) {
    final buffer = StringBuffer();

    final books = <Book>[];
    for (final t in bible.testaments) {
      books.addAll(t.books);
    }

    for (final book in books) {
      for (final chapter in book.chapters) {
        for (final verse in chapter.verses) {
          buffer.write('${book.title}\t');
          buffer.write('${chapter.id ?? 1}\t');
          buffer.write('${verse.id ?? 1}\t');
          buffer.writeln(_getVerseText(verse));
        }
      }
    }

    return buffer.toString();
  }

  String _getVerseText(BibleVerse verse) => verse.text
      .replaceAll(RegExp('<[/a-zA-Z0-9]*>'), '')
      .replaceAll(RegExp(' {2,}'), ' ')
      .trim();
}
