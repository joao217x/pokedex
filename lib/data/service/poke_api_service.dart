import 'package:pokedex/domain/entity/pokemon.dart';

abstract class PokeApiService {
  Future<List<Pokemon>> getPokemons();
}
