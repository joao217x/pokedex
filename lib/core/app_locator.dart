import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:pokedex/core/client/api_client/dio_client_impl.dart';
import 'package:pokedex/core/client/api_client/interface/api_client_interface.dart';
import 'package:pokedex/data/datasource/pokemon_remote_data_source.dart';
import 'package:pokedex/data/datasource/pokemon_remote_data_source_impl.dart';
import 'package:pokedex/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex/domain/repository/pokemon_repository.dart';
import 'package:pokedex/domain/usecase/get_pokemons.dart';
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

    //Datasource
    appLocator.registerFactory<PokemonRemoteDataSource>(
      () => PokemonRemoteDataSourceImpl(client: appLocator<IApiClient>()),
    );

    //Repository
    appLocator.registerFactory<PokemonRepository>(
      () => PokemonRepositoryImpl(
        dataSource: appLocator<PokemonRemoteDataSource>(),
      ),
    );

    //Usecase
    appLocator.registerFactory<GetPokemons>(
      () => GetPokemons(repository: appLocator<PokemonRepository>()),
    );

    //Store
    appLocator.registerFactory<HomeStore>(() => HomeStore());
  }
}
