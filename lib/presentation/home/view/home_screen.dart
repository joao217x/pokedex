import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:pokedex/core/app_locator.dart';
import 'package:pokedex/presentation/home/controller/home_store.dart';
import 'package:pokedex/shared/widgets/appbar_widget.dart';
import 'package:pokedex/shared/widgets/pokemon_card_widget.dart';

class HomeScreen extends StatelessWidget {
  final HomeStore store = appLocator<HomeStore>();

  HomeScreen({super.key}) {
    store.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: const AppBarWidget(),
      body: _content(),
    );
  }

  Widget _content() {
    return Observer(builder: (context) {
      return Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title(context),
                  if (!store.isLoading)
                    Expanded(child: _pokeList())
                  else
                    const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _title(context) {
    return Text(
      'Pokedex',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _pokeList() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
          itemCount: store.pokeList.length,
          itemBuilder: (context, index) {
            final pokemon = store.pokeList[index];

            return PokemonCardWidget(
              name: pokemon.name,
              id: pokemon.id,
              type: pokemon.types.first,
            );
          }),
    );
  }
}
