import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:pokedex/core/app_locator.dart';
import 'package:pokedex/presentation/home/controller/home_store.dart';
import 'package:pokedex/shared/widgets/appbar_widget.dart';
import 'package:pokedex/shared/widgets/pokemon_card_widget.dart';

class HomeScreen extends StatelessWidget {
  final HomeStore store = appLocator<HomeStore>();

  HomeScreen({super.key}) {
    store.getPokeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: const AppBarWidget(),
      body: _body(),
    );
  }

  Widget _body() {
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
                  store.isLoading
                      ? Center(
                          child: Column(
                            children: const [
                              SizedBox(height: 200),
                              CircularProgressIndicator(),
                            ],
                          ),
                        )
                      : store.hasError
                          ? _errorState()
                          : Expanded(child: _pokeList())
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

  Widget _errorState() {
    return Center(
      child: Column(
        children: const [
          SizedBox(height: 128),
          Icon(
            Icons.warning_rounded,
            size: 100,
          ),
          Text('Houve um erro na conexão')
        ],
      ),
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

            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/details', arguments: pokemon);
              },
              child: PokemonCardWidget(
                name: pokemon.name,
                id: pokemon.id,
                type: pokemon.types.first,
              ),
            );
          }),
    );
  }
}
