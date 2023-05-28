import 'package:dio/dio.dart' as dio;

class IApiResponse {
  final int? statusCode;
  final dynamic data;

  IApiResponse({
    required this.statusCode,
    required this.data,
  });

  factory IApiResponse.fromResponse(dio.Response response) {
    return IApiResponse(
      statusCode: response.statusCode,
      data: response.data,
    );
  }
}
