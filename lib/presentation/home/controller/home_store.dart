// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

import 'package:pokedex/core/app_locator.dart';
import 'package:pokedex/core/usecase/usecase.dart';
import 'package:pokedex/domain/entity/pokemon.dart';
import 'package:pokedex/domain/usecase/get_pokemons.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final GetPokemons getPokemons = appLocator.get<GetPokemons>();

  @observable
  List<Pokemon> pokeList = [];

  @action
  Future<void> getPokeList() async {
    setIsLoading(true);

    final result = await getPokemons.handle(emptyParams);
    result.fold(
      (left) => setHasError(true),
      (list) => pokeList = list,
    );

    setIsLoading(false);
  }

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  bool hasError = false;
  @action
  void setHasError(bool value) => hasError = value;
}
