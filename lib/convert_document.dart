import 'dart:io';
import 'package:json5/json5.dart';
import 'package:videopsalm_to_sog_converter/converters/bible_converter.dart';
import 'package:videopsalm_to_sog_converter/converters/songbook_converter.dart';
import 'package:videopsalm_to_sog_converter/models/bible/bible.dart';
import 'package:videopsalm_to_sog_converter/models/songs/songbook.dart';

void convertDocument(String inputFilePath, String documentType) async {
  try {
    print('Start reading... Path = $inputFilePath');

    final file = File(inputFilePath);
    final rawdata =
        (await file.readAsString()).replaceAll('\n', ' ').replaceAll('\r', '');

    print('Decoding json...');

    final data = json5Decode(rawdata);

    print('JSON decoded');
    print('Converting to SOG...');

    String result = '';

    if (documentType == '--songbook') {
      final songbook = Songbook.fromJson(data);
      result = SongbookConverter().convertToSogFormat(songbook);
    } else if (documentType == '--bible') {
      final bible = Bible.fromJson(data);
      result = BibleConverter().convertToSogFormat(bible);
    }

    if (result.isEmpty) throw 'Specify proper document type';

    print('Saving converted file...');

    final outPath = '$inputFilePath-converted.sog';

    final outFile = File(outPath);
    await outFile.writeAsString(result);

    print('File saved: $outPath');
  } catch (e) {
    print(e);
  }
}
