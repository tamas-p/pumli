import 'dart:io';

import 'package:pumli/pumli.dart';
import 'package:pumli/src/assistance.dart';

import 'constants.dart';

const model = complexModel;

final _log = getLogger('pumli_example');

Future<void> main() async {
  initLogging();
  _log.info('Starting Pumli server.');

  // This uses the public service from PlantUML at www.plantuml.com.
  // Use it according to their service conditions and your security expectations.
  final pumliREST = PumliREST(serviceURL: PumliREST.plantUmlUrl);
  final stopwatch = Stopwatch()..start();

  // For this you need plantuml installed and its server run: $plantuml -picoweb
  // final pumliREST = PumliREST(server: 'http://127.0.0.1:8080');

  stopwatch.reset();
  _log.info('PumliREST - Converting model to PNG.');
  final buffer = await pumliREST.getPNG(model);
  _log.info('Elapse: ${stopwatch.elapsed}');
  await File('${outPrefix}_rest.png').writeAsBytes(buffer);

  stopwatch.reset();
  _log.info('PumliREST - Converting model to SVG.');
  final svg1 = await pumliREST.getSVG(model);
  _log.info('Elapse: ${stopwatch.elapsed}');
  await File('${outPrefix}_rest.svg').writeAsString(svg1);

  _log.info('Creating PumliCmd.');
  final pumliCmd1 = PumliCmd();

  stopwatch.reset();
  _log.info('PumliCmd - Converting model to PNG.');
  final buffer2 = await pumliCmd1.getPNG(model);
  _log.info('Elapse: ${stopwatch.elapsed}');
  await File('${outPrefix}_cmd_plantuml.png').writeAsBytes(buffer2);

  stopwatch.reset();
  _log.info('PumliCmd - Converting model to SVG.');
  final svg2 = await pumliCmd1.getSVG(model);
  _log.info('Elapse: ${stopwatch.elapsed}');
  await File('${outPrefix}_cmd_plantuml.svg').writeAsString(svg2);

  _log.info('Creating PumliCmdJar.');
  final pumliCmdJar = PumliCmd(jar: jarPath);

  stopwatch.reset();
  _log.info('PumliCmdJar - Converting model to PNG.');
  final buffer3 = await pumliCmdJar.getPNG(model);
  _log.info('Elapse: ${stopwatch.elapsed}');
  await File('${outPrefix}_cmd_jar.png').writeAsBytes(buffer3);

  stopwatch.reset();
  _log.info('PumliCmdJar - Converting model to SVG.');
  final svg3 = await pumliCmdJar.getSVG(model);
  _log.info('Elapse: ${stopwatch.elapsed}');
  await File('${outPrefix}_cmd_jar.svg').writeAsString(svg3);
}
