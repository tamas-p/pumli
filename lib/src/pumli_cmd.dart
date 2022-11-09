import 'dart:io';

import 'package:pumli/src/assistance.dart';
import 'package:pumli/src/pumli.dart';
import 'package:pumli/src/utility.dart';

/// [PumliCmd] is rendering the diagrams by invoking a command line executable.
/// and piping the diagram to the stdin of the plantuml process and reads the
/// rendered diagram from its stdout. If [jar] is given to its constructor then
/// it will use java to start the plantuml process.
class PumliCmd implements Pumli {
  /// [jar] is the location of a PlanUML jar file.
  PumliCmd({
    this.jar,
  });
  String? jar;

  static final _log = getLogger('$PumliCmd');

  @override
  Future<List<int>> getPNG(String diagram) => _execPlantUml('png', diagram);

  @override
  Future<String> getSVG(String diagram) async {
    final buffer = await _execPlantUml('svg', diagram);
    return buffer.toUtf8String();
  }

  /// Executes the plantuml command / java with plantuml.jar with [format]
  /// argument and sends [diagram] to its stdin abd reads the rendered
  /// diagram from its stdout.
  Future<List<int>> _execPlantUml(String format, String diagram) async {
    late String executable;
    late List<String> arguments;

    final fixArgs = ['-p', '-t$format'];

    if (jar == null) {
      executable = 'plantuml';
      arguments = fixArgs;
    } else {
      executable = 'java';
      arguments = ['-jar', jar!, ...fixArgs];
    }

    _log.fine('$executable ${arguments.join(', ')}');
    final process = await Process.start(executable, arguments);
    process.stderr.listen((buffer) => _log.warning(buffer.toUtf8String()));

    process.stdin.writeln(diagram);
    await process.stdin.close();
    final result = await process.stdout.toFlatList();

    final exitCode = await process.exitCode;
    _log.info('exit code: $exitCode');
    return result;
  }
}
