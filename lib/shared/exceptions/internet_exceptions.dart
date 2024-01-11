class TimeoutException implements Exception {
  final String message;
  TimeoutException({this.message = "Connection Timeout"});
  @override
  String toString() => message;
}

class NetworkException implements Exception {
  final String message;
  NetworkException({this.message = "No Internet"});
  @override
  String toString() => message;
}

class UnknownException implements Exception {
  final String message;
  UnknownException({this.message = "Unknown Error"});
  @override
  String toString() => message;
}

class BadRequestException implements Exception {
  final String message;
  BadRequestException({this.message = ""});
  @override
  String toString() => message;
}

class UnauthorizedException {
  final String message;
  UnauthorizedException({this.message = "401"});
  @override
  String toString() => message;
}
