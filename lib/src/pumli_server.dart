import 'dart:async';
import 'dart:io';

import 'package:pumli/src/assistance.dart';
import 'package:pumli/src/pumli_exception.dart';
import 'package:pumli/src/utility.dart';

/// Starts a PlantUML service.
///
/// It starts diagram rendering service with the help of the integrated
/// "picoweb" server of PlantUML. If no argument is provided to its constructor
/// it uses the plantuml command to start the service.
/// If the [jar] argument is given and it is a PlantUML jar it will use java to
/// start the PlantUML service.
/// [port] and [bind] can be given to set listening port and binding.
class PumliServer {
  /// If the [jar] argument is given and it
  /// is a PlantUML jar it will use java to start the PlantUML service.
  PumliServer({
    this.jar,
    int? port,
    String? bind,
  })  : port = port ?? 8080,
        bind = bind ?? '127.0.0.1';
  final String? jar;
  final int port;
  final String bind;

  // StreamSubscription<List<int>>? _stderrSubscription;
  // StreamSubscription<List<int>>? _stdoutSubscription;

  static final _log = getLogger('$PumliServer');

  String get url => 'http://$bind:$port';
  Process? _process;

  /// Starts the plantuml -picoweb server with [port] and [bind].
  Future<void> start() async {
    late String executable;
    late List<String> arguments;

    final fixArgs = ['-picoweb:$port:$bind'];

    if (jar == null) {
      executable = 'plantuml';
      arguments = fixArgs;
    } else {
      executable = 'java';
      arguments = [
        '-jar',
        jar!,
        '-Djava.net.useSystemProxies=true',
        ...fixArgs,
      ];
    }

    final command = '"$executable ${arguments.join(', ')}"';
    _log.info('Executing: $command');

    try {
      _process = await Process.start(executable, arguments);
    } on Exception {
      throw PumliException('Could not start $command');
    }
    _process?.exitCode.then((value) {
      final msg = '$command exited with $value';
      _log.severe(msg);
      throw PumliException(msg);
    }).onError((error, stackTrace) {
      throw PumliException(error.toString());
    });

    _process?.stderr
        // ignore: avoid_print
        .listen((buffer) => print('$command:\n${buffer.toUtf8String()}'));
    _process?.stdout
        // ignore: avoid_print
        .listen((buffer) => print('$command:\n${buffer.toUtf8String()}'));
    await _waitTillServerIsUp();
  }

  // Safer to rely on terminal sending SIGINT to foreground process-group.
  // Sending signal only to started process like the 'plantuml' command, that
  // is a shell script, will not kill this shell scripts child the actual java
  // process running plantuml (leave it there running forever).
  // bool stop() {
  //   _stderrSubscription?.cancel();
  //   _stdoutSubscription?.cancel();
  //   final result = _process?.kill() ?? false;
  //   _process?.kill();
  //   return result;
  // }

  /// When we start the server we would like to check when it is up. This
  /// Future completes when the server accepts incoming socket connections.
  Future<void> _waitTillServerIsUp() async {
    while (true) {
      try {
        final socket = await Socket.connect(bind, port);
        // We have to use destroy to close socket to both directions as close
        // only closes the send direction and would leave async operations
        // pending resulting process not exiting after main() finished.
        socket.destroy();
        break;
      } catch (e) {
        _log.finest(e);
        await Future<void>.delayed(const Duration(milliseconds: 100));
      }
    }
  }
}
