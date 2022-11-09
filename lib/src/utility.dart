import 'dart:convert';

extension StreamUtility on Stream<List<int>> {
  /// Flatten the incoming stream of List<int> items into a single List<int>.
  Future<List<int>> toFlatList() async {
    final result = <int>[];
    await for (final data in this) {
      result.addAll(data);
    }
    return result;
  }
}

extension ListUtility on List<int> {
  /// Helper method to convert the int buffer to an UTF8 string.
  String toUtf8String() => utf8.decoder.convert(this);
}
