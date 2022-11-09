import 'package:logging/logging.dart';

/// Package name for logging prefix.
const pumliName = 'pumli';

/// Logging convenience function to hierarchical logging.
Logger getLogger(String name) => Logger('$pumliName.$name');

/// Initialize logging.
void initLogging() {
  // This shall be done 1st to allow Logger configuration for a hierarchy.
  hierarchicalLoggingEnabled = true;
  // Root level is switched off to allow only specific loggers to enable.
  Logger.root.level = Level.OFF;

  Logger(pumliName).level = Level.INFO;
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print(
      '${record.level.name}: '
      '${record.time}: '
      '${record.loggerName}: '
      '${record.message}',
    );
  });
}
