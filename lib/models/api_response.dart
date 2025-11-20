class ApiResponse<T> {
  final int status;
  final String message;
  final String timestamp;
  final T? data;

  ApiResponse({
    required this.status,
    required this.message,
    required this.timestamp,
    this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic)? fromJsonT,
  ) {
    return ApiResponse(
      status: json['status'] as int,
      message: json['message'] as String,
      timestamp: json['timestamp'] as String,
      data: json['data'] != null && fromJsonT != null
          ? fromJsonT(json['data'])
          : json['data'] as T?,
    );
  }
}