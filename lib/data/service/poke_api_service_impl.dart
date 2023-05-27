import 'dart:developer';

import 'package:pokedex/data/model/pokemon_model.dart';
import 'package:pokedex/data/service/poke_api_service.dart';
import 'package:pokedex/domain/client/api_client/interface/api_client.dart';
import 'package:pokedex/domain/entity/pokemon.dart';
import 'package:pokedex/domain/util/app_envs.dart';

class PokeApiServiceImpl implements PokeApiService {
  final ApiClient client;

  PokeApiServiceImpl({required this.client});

  @override
  Future<List<Pokemon>> getPokemons() async {
    final response = await client.get('${AppEnvs.apiUrl}pokemon');

    if (response.statusCode == 200) {
      try {
        final response = await client.get('${AppEnvs.apiUrl}pokemon');
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
