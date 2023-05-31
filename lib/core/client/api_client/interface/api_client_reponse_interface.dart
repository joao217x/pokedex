import 'package:dio/dio.dart' as dio;

class IApiClientResponse {
  final int? statusCode;
  final dynamic data;

  IApiClientResponse({
    required this.statusCode,
    required this.data,
  });

  factory IApiClientResponse.fromResponse(dio.Response response) {
    return IApiClientResponse(
      statusCode: response.statusCode,
      data: response.data,
    );
  }
}
