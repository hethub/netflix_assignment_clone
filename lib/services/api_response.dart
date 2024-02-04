class ApiResponse<T> {
  T? data;
  int? statusCode;
  String? message;
  bool success;
  ApiResponse({
    this.data,
    this.statusCode,
    this.message,
    this.success = true,
  });

  ({int? statusCode, String? message, bool? success}) get info =>
      (statusCode: statusCode, message: message, success: success);
}
