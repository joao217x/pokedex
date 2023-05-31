import 'package:pokedex/core/client/api_client/interface/api_client_reponse_interface.dart';

abstract class IApiClient {
  Future<IApiClientResponse> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });
}
