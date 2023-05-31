import 'package:pokedex/core/error/failure.dart';
import 'package:pokedex/core/usecase/utils/either.dart';
import 'package:pokedex/domain/entity/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemons();
}
