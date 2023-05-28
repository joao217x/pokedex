import 'package:dio/dio.dart';
import 'package:pokedex/domain/client/api_client/interface/api_client_interface.dart';
import 'package:pokedex/domain/client/api_client/interface/api_reponse_interface.dart';

class DioClientImpl implements IApiClient {
  final Dio client;

  DioClientImpl({required this.client});

  @override
  Future<IApiResponse> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final response = await client.get(path);

    return IApiResponse.fromResponse(response);
  }
}
