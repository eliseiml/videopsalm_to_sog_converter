import 'package:videopsalm_to_sog_converter/convert_document.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print(
        'Please, provide correct input data or type "vp2sog -h" to see details.');
    return;
  }

  final documentType = arguments[0].toLowerCase();

  if (documentType == '-h' || documentType == '--help') {
    print('------ VideoPslam to SongOfGod converter ------\n');
    print('First argument is a document type: --bible | --songbook');
    print('Second argument: path to source file (.json)');
    print('Command example: \$vp2sog --songbook /Users/Admin/songbook1.json');
    return;
  }

  if (arguments.length < 2) {
    print(
        'Please, provide correct input data or type "vp2sog -h" to see details.');
    return;
  }

  final inputFilePath = arguments[1];

  if (documentType == '--bible' || documentType == '--songbook') {
    convertDocument(inputFilePath, documentType);
    return;
  }

  print('Please, provide correct document type.');
  print('Type "vp2sog -h" to see details');
}
