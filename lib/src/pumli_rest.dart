import 'dart:io';

import 'package:pumli/src/pumli.dart';
import 'package:pumli/src/pumli_exception.dart';
import 'package:pumli/src/text_encode.dart';
import 'package:pumli/src/utility.dart';

/// Rendering PlantUML diagrams through a web service.
///
/// Establishes a https connection to the [serviceURL], request rendering
/// of the text format diagram as the last section of the path and then reads
/// the rendered output from the service.
class PumliREST implements Pumli {
  PumliREST({
    required this.serviceURL,
  });
  final String serviceURL;

  /// PlantUML service URL. It is a public service, use it according
  /// to their service conditions, your security expectations and your
  /// performance expectation (remote service = slower render).
  static const plantUmlUrl = 'https://www.plantuml.com/plantuml';

  @override
  Future<String> getSVG(String diagram) {
    return _getUtf8String(_getUrl('svg', diagram));
  }

  @override
  Future<List<int>> getPNG(String diagram) {
    return _getBytes(_getUrl('png', diagram));
  }

  /// Opens the connection to the given [url] (that will include the
  /// encoded text diagram) and reads the response and returns it.
  Future<List<int>> _getBytes(String url) async {
    try {
      final client = HttpClient();
      final request = await client.getUrl(Uri.parse(url));
      final response = await request.close();
      final result = await response.toFlatList();
      client.close();
      return result;
    } catch (e) {
      throw PumliException(
        '''
        Could not connect to PlantUML server at $serviceURL
        See exception: $e
        ''',
      );
    }
  }

  /// As [_getBytes], but it returns a string in UTF8 format.
  Future<String> _getUtf8String(String url) async {
    final buffer = await _getBytes(url);
    return buffer.toUtf8String();
  }

  /// Compose the URL string from [serviceURL], [format] and the [diagram].
  String _getUrl(String format, String diagram) =>
      '$serviceURL/$format/${plantUmlTextEncode(diagram)}';
}
