import 'package:pokedex/domain/entity/pokemon.dart';

abstract class PokemonRemoteDataSource {
  Future<List<Pokemon>?> getPokemons();
}
