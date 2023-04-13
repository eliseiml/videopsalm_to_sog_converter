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
    final rawdata = await file.readAsString();

    final preparedData = prepareJson(rawdata);

    print('Decoding json...');

    final data = json5Decode(preparedData);

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

String prepareJson(String data) {
  final result = data.replaceAll('\$', '&').replaceAllMapped(
    RegExp(r'"(?:\\.|[^\\"])*"', multiLine: true),
    (match) {
      final item = match[0];
      if (item == null) throw 'Error. item = null at ${match.start}';
      return item.replaceAll('\n', r'$ ').replaceAll('\r', '');
    },
  );
  return result
      .replaceAll('\n', ' ')
      .replaceAll('\r', '')
      .replaceAll(RegExp(r' {1}\$'), r'$');
}
