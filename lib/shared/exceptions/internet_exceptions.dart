class TimeoutException implements Exception {
  final String message;
  TimeoutException({this.message = "Connection Timeout"});
  @override
  String toString() => message;
}

class NetworkException implements Exception {
  final String message;
  NetworkException({this.message = "You have a network problem"});
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
