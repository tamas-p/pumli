import 'dart:convert';

import 'dart:io';

/// Provides text encoding that complies with https://plantuml.com/text-encoding
/// This implementation is based on implementation examples on that page.
String plantUmlTextEncode(String text) {
  final data = utf8.encode(text);
  final deflate = ZLibCodec(level: 9, raw: true);
  final compressed = deflate.encode(data);
  return _encode64(compressed);
}

String _encode64(List<int> data) {
  var r = '';
  for (var i = 0; i < data.length; i += 3) {
    if (i + 2 == data.length) {
      r += _append3bytes(data.elementAt(i), data.elementAt(i + 1), 0);
    } else if (i + 1 == data.length) {
      r += _append3bytes(data.elementAt(i), 0, 0);
    } else {
      r += _append3bytes(
        data.elementAt(i),
        data.elementAt(i + 1),
        data.elementAt(i + 2),
      );
    }
  }
  return r;
}

String _append3bytes(int b1, int b2, int b3) {
  final c1 = b1 >> 2;
  final c2 = ((b1 & 0x3) << 4) | (b2 >> 4);
  final c3 = ((b2 & 0xF) << 2) | (b3 >> 6);
  final c4 = b3 & 0x3F;
  var r = '';
  r += _encode6bit(c1 & 0x3F);
  r += _encode6bit(c2 & 0x3F);
  r += _encode6bit(c3 & 0x3F);
  r += _encode6bit(c4 & 0x3F);
  return r;
}

String _encode6bit(int input) {
  var b = input;
  if (b < 10) {
    return String.fromCharCode(48 + b);
  }
  b -= 10;
  if (b < 26) {
    return String.fromCharCode(65 + b);
  }
  b -= 26;
  if (b < 26) {
    return String.fromCharCode(97 + b);
  }
  b -= 26;
  if (b == 0) {
    return '-';
  }
  if (b == 1) {
    return '_';
  }
  return '?';
}

void main(List<String> arguments) {
  const model = '''
@startuml
start
:Hello Pumli user!;
stop
@enduml
''';

  // ignore: avoid_print
  print(plantUmlTextEncode(model));
}
