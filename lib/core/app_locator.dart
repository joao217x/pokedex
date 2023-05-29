import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:pokedex/data/service/poke_api_service_impl.dart';
import 'package:pokedex/data/service/poke_api_service_interface.dart';
import 'package:pokedex/domain/client/api_client/dio_client_impl.dart';
import 'package:pokedex/domain/client/api_client/interface/api_client_interface.dart';
import 'package:pokedex/presentation/home/controller/home_store.dart';

GetIt appLocator = GetIt.instance;

class AppLocator {
  void setup() {
    //Lib
    appLocator.registerFactory<Dio>(() => Dio());

    //Client
    appLocator.registerFactory<IApiClient>(
      () => DioClientImpl(client: appLocator<Dio>()),
    );

    //Service
    appLocator.registerFactory<IPokeApiService>(
      () => PokeApiServiceImpl(client: appLocator<IApiClient>()),
    );

    //Controller/Store
    appLocator.registerFactory<HomeStore>(
      () => HomeStore(pokeApi: appLocator<IPokeApiService>()),
    );
  }
}
