import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/data/service/poke_api_service.dart';
import 'package:pokedex/data/service/poke_api_service_impl.dart';
import 'package:pokedex/domain/client/api_client/dio_client_impl.dart';
import 'package:pokedex/domain/client/api_client/interface/api_client.dart';

GetIt appLocator = GetIt.instance;

class AppLocator {
  void setup() {
    //Lib
    appLocator.registerFactory<Dio>(() => Dio());

    //Client
    appLocator.registerFactory<ApiClient>(
      () => DioClientImpl(client: appLocator<Dio>()),
    );

    //Service
    appLocator.registerFactory<PokeApiService>(
      () => PokeApiServiceImpl(client: appLocator<DioClientImpl>()),
    );
  }
}
