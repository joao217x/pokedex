import 'package:dio/dio.dart' as dio;

class ApiResponseInterface {
  final int? statusCode;
  final dynamic data;

  ApiResponseInterface({
    required this.statusCode,
    required this.data,
  });

  factory ApiResponseInterface.fromResponse(dio.Response response) {
    return ApiResponseInterface(
      statusCode: response.statusCode,
      data: response.data,
    );
  }
}
