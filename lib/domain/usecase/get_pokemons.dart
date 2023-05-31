import 'package:pokedex/core/error/failure.dart';
import 'package:pokedex/core/usecase/usecase.dart';
import 'package:pokedex/core/usecase/utils/either.dart';
import 'package:pokedex/domain/entity/pokemon.dart';
import 'package:pokedex/domain/repository/pokemon_repository.dart';

class GetPokemons extends UseCase<List<Pokemon>, NoParams> {
  final PokemonRepository repository;

  GetPokemons({required this.repository});

  @override
  Future<Either<Failure, List<Pokemon>>> handle(params) async {
    return await repository.getPokemons();
  }
}
