class ApiResponse {
  ApiResponse({required this.success, this.message, this.data});

  bool success;
  String? message;
  dynamic data;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        success: json['success'],
        message: json['message'],
        data: json['data'] ?? "",
      );

  Map<String, dynamic> toJson() => {"success": success, "message": message, "data": data};
}
