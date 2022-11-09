/// Abstract class to define interface for the Pumli implementations.
abstract class Pumli {
  /// Getting SVG render of [diagram].
  Future<String> getSVG(String diagram);

  /// Getting PNG render of [diagram].
  Future<List<int>> getPNG(String diagram);
}
