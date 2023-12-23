class ApiDataResponse<T> {
  final bool isSuccess;
  final String message;
  final T data;

  ApiDataResponse({
    required this.isSuccess,
    required this.message,
    required this.data,
  });
}
