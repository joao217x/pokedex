import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/core/app_locator.dart';
import 'package:pokedex/presentation/home/controller/home_store.dart';

class HomeScreen extends StatelessWidget {
  final HomeStore store = appLocator<HomeStore>();

  HomeScreen({super.key}) {
    store.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        return store.isLoading
            ? Center(child: CircularProgressIndicator())
            // : Center(child: Text(store.pokeList[4].name));
            : ListView.builder(
                itemCount: store.pokeList.length,
                itemBuilder: (context, index) {
                  final pokemon = store.pokeList[index];

                  return Center(
                    child: Column(
                      children: [
                        Text(store.pokeList[index].name),
                        CachedNetworkImage(
                          imageUrl:
                              'https://img.pokemondb.net/artwork/${store.pokeList[index].name}.jpg',
                        )
                      ],
                    ),
                  );
                });
      }),
    );
  }
}
