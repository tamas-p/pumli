<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

PlantUML interface for Dart.

Allows easy conversion of diagrams in PlantUML (see https://plantuml.com) text format to various
output formats with the help of PlantUML tools, directly from dart.

Tested on Ubuntu 20.04LTS, but it is expected to work on other Operating Systems as well.

## Features

- Dart API to convert String PlantUML diagrams to various output formats (SVG, PNG for now):
  - PumliCmd uses plantuml command line API to convert the diagrams.
  - PumliREST uses the web API for PlantUML to convert the diagrams.
- PumliServer to start picoweb service of PlantUML:
  - Start plantuml command (need to be installed as a prerequisite) in picoweb mode with the given arguments.
  - Start java with the given PlantUML jar in picoweb mode with the given arguments.

See it in action the simplest way possible:

```dart
const simpleModel = '''
@startuml
start
:Hello Pumli user!;
stop
@enduml
''';

final svg = await PumliREST(serviceURL: PumliREST.plantUmlUrl).getSVG(simpleModel);
```

and the SVG generated:

![Alt hello.svg](https://github.com/tamas-p/pumli/blob/main/resources/hello.svg?raw=true)

## Getting started

The easiest to start with the package to use an already available PlantUML rendering service like the public one at https://www.plantuml.com/plantuml if you are comfortable with sending your diagrams over the internet to a public server and you do not mind the slight performance impact of a remote renderer. This allows you to start right away with PumliREST (no need to install PlantUML).

In case you want to use either your own lightweight PlantUML renderer service (recommended for performance and security) or the plantuml command line tool for conversion, you need the plantuml tool to be installed onto your system. See https://plantuml.com/starting for details. As you will see PlantUML requires GraphViz (https://plantuml.com/graphviz-dot) for its operation. Nevertheless, on Ubuntu installation is as simple as

```shell
$sudo apt install plantuml
```

## Usage

We are going to convert the simple diagram that was already used above to SVG format:

```dart
const simpleModel = '''
@startuml
start
:Hello Pumli user;
stop
@enduml
''';
```

> **_NOTE:_** Use raw string in case your model includes escaped characters like '\n':
>
> ```dart
> const rawString = r'demo\n';
> ```

### Convert it with the public PlantUML rendering service

```dart
final pumliREST = PumliREST(serviceURL: PumliREST.plantUmlUrl);
final svg = await pumliREST.getSVG(model);
await File('/tmp/simple_rest.svg').writeAsString(svg);
```

`serviceURL` could have been any PlantUML web api compliant service you have access to.
For example on Linux you can start one from the command line:

```bash
$ plantuml -picoweb
webPort=8080
```

In this case `serviceURL` would be '127.0.0.1:8080'

### Convert simpleModel with using the PlantUML command line API

This first version can be used if the plantuml command is preinstalled on your system:

```dart
final pumliCmd = PumliCmd();
final svg2 = await pumliCmd.getSVG(model);
await File('/tmp/simple_cmd.svg').writeAsString(svg2);
```

If you only have the PlantUML jar available (and GraphViz is installed):

```dart
final pumliCmdJar = PumliCmd(jar: '/path/to/plantuml.jar');
final svg3 = await pumliCmdJar.getSVG(model);
await File('/tmp/simple_cmd_jar.svg').writeAsString(svg3);
```

### Starting you own local PlantUML picoweb renderer from dart

as simple as

```dart
final pumliServer = PumliServer();
await pumliServer.start();
```

This will start the `plantuml -picoweb:8080:127.0.0.1` command. By default it listens on port 8080 and binds to the localhost (127.0.0.1 - only localhost connections are accepted). After this you can start using it right away:

```dart
final pumliREST = PumliREST(serviceURL: pumliServer.url);
final svg = await pumliREST.getSVG(model);
await File('/tmp/simple_rest.svg').writeAsString(svg);
```

PumliServer constructor includes three parameters to customize its behavior: `port` to define the listening port of the service, `bind` to set the bind address (e.g. setting it to 0.0.0.0 will let connections on any interfaces) and `jar` to define the PlantUML jar path if you want PumliServer to use java directly to start the picoweb service.

## Additional information

If you have any questions, comments please go to [Pumli GitHub Discussions](https://github.com/tamas-p/pumli/discussions) to start or join discussions.
