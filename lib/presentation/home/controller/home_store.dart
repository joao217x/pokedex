// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

import 'package:pokedex/data/service/poke_api_service_interface.dart';
import 'package:pokedex/domain/entity/pokemon.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final IPokeApiService pokeApi;

  _HomeStoreBase({required this.pokeApi});

  @observable
  List<Pokemon> pokeList = [];

  @action
  Future<void> getPokemons() async {
    try {
      initLoading();
      final response = await pokeApi.getPokemons();
      pokeList = response;
      endLoading();
    } catch (_) {
      setIsError(true);
    }
  }

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  bool isError = false;
  @action
  void setIsError(bool value) => isError = value;

  void initLoading() {
    setIsError(false);
    setIsLoading(true);
  }

  void endLoading() {
    setIsError(false);
    setIsLoading(false);
  }
}
