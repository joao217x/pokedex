import 'package:pokedex/domain/client/api_client/interface/api_reponse_interface.dart';

abstract class IApiClient {
  Future<IApiResponse> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });
}
