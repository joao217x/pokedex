import 'dart:developer';

import 'package:pokedex/core/app_envs.dart';
import 'package:pokedex/core/client/api_client/interface/api_client_interface.dart';
import 'package:pokedex/data/datasource/pokemon_remote_data_source.dart';
import 'package:pokedex/data/model/pokemon_model.dart';
import 'package:pokedex/domain/entity/pokemon.dart';

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final IApiClient client;

  PokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Pokemon>?> getPokemons() async {
    final response = await client.get(AppEnvs.apiUrl);

    if (response.statusCode == 200) {
      try {
        final data = response.data['results'] as List;

        final pokemonList = <Pokemon>[];
        for (final item in data) {
          final pokemonUrl = item['url'] as String;
          final pokemonResponse = await client.get(pokemonUrl);
          final pokemonData = pokemonResponse.data as Map<String, dynamic>;
          final pokemon = PokemonModel.fromJson(pokemonData);
          pokemonList.add(pokemon);
        }

        return pokemonList;
      } catch (e) {
        log(error: 'getPokemons', 'error when creating pokemonList: $e');
      }
    }
    log(error: 'getPokemons', 'response status != 200');
    return [];
  }
}
