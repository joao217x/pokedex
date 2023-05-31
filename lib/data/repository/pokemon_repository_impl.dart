import 'dart:developer';

import 'package:pokedex/core/error/failure.dart';
import 'package:pokedex/core/usecase/utils/either.dart';
import 'package:pokedex/data/datasource/pokemon_remote_data_source.dart';
import 'package:pokedex/domain/entity/pokemon.dart';
import 'package:pokedex/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource dataSource;

  PokemonRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemons() async {
    try {
      final response = await dataSource.getPokemons();

      if (response != null) {
        return right(response);
      }
      return left(const Failure());
    } catch (e) {
      log(error: 'getPokemons', 'error on repository: $e');

      return left(const Failure());
    }
  }
}
