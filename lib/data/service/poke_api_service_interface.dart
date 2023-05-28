import 'package:pokedex/domain/entity/pokemon.dart';

abstract class IPokeApiService {
  Future<List<Pokemon>> getPokemons();
}
