import 'package:videopsalm_to_sog_converter/models/songs/song.dart';
import 'package:videopsalm_to_sog_converter/models/songs/song_verse.dart';
import 'package:videopsalm_to_sog_converter/models/songs/songbook.dart';

class SongbookConverter {
  String convertToSogFormat(Songbook songbook) {
    final buffer = StringBuffer();

    final maxNumberDigitsCount = songbook.songs.length.toString().length;

    for (final song in songbook.songs) {
      buffer.writeln(_getSongId(song, maxNumberDigitsCount));
      buffer.writeln(_getSongTitle(song));

      for (final verse in song.verses) {
        final prefix = verse.tag != null ? '* ' : '${verse.id ?? 1}. ';
        buffer.write(prefix);
        buffer.writeln(_getVerseText(verse));
      }

      buffer.writeln();
    }

    return buffer.toString();
  }

  String _getSongId(Song song, int padding) => _padNumber(song.id, padding);

  String _getSongTitle(Song song) =>
      song.title.replaceAll('${song.id}', '').trim();

  String _getVerseText(SongVerse verse) => verse.text
      .replaceAll(RegExp('<[/a-zA-Z0-9]*>'), '')
      .replaceAll(RegExp(' {2,}'), ' ')
      .replaceAll(' / x 2', '}-x2')
      .replaceAll(' / x 3', '}-x3')
      .replaceAll(' / x 4', '}-x4')
      .replaceAll('/ ', ' {')
      .trim();

  String _padNumber(int number, int digitsCount) =>
      '$number'.padLeft(digitsCount, '0');
}
