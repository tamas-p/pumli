import 'dart:io';

import 'package:pumli/pumli.dart';
import 'package:pumli/src/assistance.dart';

import 'constants.dart';

final _log = getLogger('pumli_server_example');

Future<void> main() async {
  initLogging();
  // If you want to use a specific plantuml.jar:
  // final pumliServer = PumliServer(
  //   port: 1111,
  //   jar: '~/Downloads/plantuml-1.2022.0.jar',
  // );

  // This uses the plantuml command (prerequisite) to start the picoweb service.
  final pumliServer = PumliServer();

  _log.info('Starting pumliServer...');
  await pumliServer.start();
  _log.info('Started with URL=${pumliServer.url}');

  final pumliREST = PumliREST(serviceURL: pumliServer.url);
  final stopwatch = Stopwatch()..start();

  const model = complexModel;

  for (var i = 0; i < 25; i++) {
    await pngRequest(i, stopwatch, pumliREST, model);
    await svgRequest(i, stopwatch, pumliREST, model);
  }

  // _log.info('Stop result: ${pumliServer.stop()}');
  _log.info('Press Ctr+C to stop.');
}

Future<void> pngRequest(
  int i,
  Stopwatch stopwatch,
  PumliREST pumliREST,
  String model,
) async {
  stopwatch.reset();
  final buffer = await pumliREST.getPNG(model);
  _log.info('PNG Elapse: ${stopwatch.elapsed}');
  await File('${outPrefix}_server_$i.png').writeAsBytes(buffer);
}

Future<void> svgRequest(
  int i,
  Stopwatch stopwatch,
  PumliREST pumliREST,
  String model,
) async {
  stopwatch.reset();
  final svg = await pumliREST.getSVG(model);
  _log.info('SVG Elapse: ${stopwatch.elapsed}');
  await File('${outPrefix}_server_$i.svg').writeAsString(svg);
}
