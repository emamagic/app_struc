
class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}

class PrefsException implements Exception {
  final String message;

  const PrefsException(this.message);
}