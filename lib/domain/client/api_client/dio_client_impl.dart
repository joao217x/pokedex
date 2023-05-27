import 'package:dio/dio.dart';
import 'package:pokedex/domain/client/api_client/interface/api_client.dart';
import 'package:pokedex/domain/client/api_client/interface/api_reponse.dart';

class DioClientImpl implements ApiClient {
  final Dio client;

  DioClientImpl({required this.client});

  @override
  Future<ApiResponseInterface> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final response = await client.get(path);

    return ApiResponseInterface.fromResponse(response);
  }
}
