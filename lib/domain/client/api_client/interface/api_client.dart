import 'package:pokedex/domain/client/api_client/interface/api_reponse.dart';

abstract class ApiClient {
  Future<ApiResponseInterface> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });
}
