import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/core/app_locator.dart';
import 'package:pokedex/presentation/home/controller/home_store.dart';
import 'package:pokedex/shared/app_images.dart';
import 'package:pokedex/shared/widgets/pokemon_card.dart';

class HomeScreen extends StatelessWidget {
  final HomeStore store = appLocator<HomeStore>();

  HomeScreen({super.key}) {
    store.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Image.asset(AppImages.logo, height: 150),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
        ),
      ),
      body: Observer(builder: (context) {
        return Column(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pokedex',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: store.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                    itemCount: store.pokeList.length,
                                    itemBuilder: (context, index) {
                                      final pokemon = store.pokeList[index];

                                      return PokemonCard(
                                        name: pokemon.name,
                                        id: pokemon.id,
                                        type: pokemon.types.first,
                                      );
                                    }),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
