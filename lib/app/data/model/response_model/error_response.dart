import 'dart:convert';

class ErrorResponse {
  ErrorResponse({
    required this.errors,
  });

  dynamic errors;

  factory ErrorResponse.fromRawJson(String str) =>
      ErrorResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        errors: json["errors"],
      );

  Map<String, dynamic> toJson() => {
        "error": errors,
      };
}
