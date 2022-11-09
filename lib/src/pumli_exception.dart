/// Exception to be dropped from Pumli code.
class PumliException implements Exception {
  PumliException(this.message);
  final String message;

  @override
  String toString() {
    return message;
  }
}
