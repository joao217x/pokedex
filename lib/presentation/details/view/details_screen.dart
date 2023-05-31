import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:pokedex/data/model/pokemon_model.dart';
import 'package:pokedex/shared/app_strings.dart';
import 'package:pokedex/shared/widgets/appbar_widget.dart';
import 'package:pokedex/shared/widgets/pokemon_info_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color(context),
      appBar: const AppBarWidget(),
      body: _body(context),
    );
  }

  Widget _body(context) {
    return Column(
      children: [
        _image(context),
        _info(context),
      ],
    );
  }

  Widget _image(context) {
    final pokemon = ModalRoute.of(context)?.settings.arguments as PokemonModel;

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      height: 180,
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: AppStrings.infoImageUrl(id: pokemon.id),
      ),
    );
  }

  Widget _info(context) {
    final pokemon = ModalRoute.of(context)?.settings.arguments as PokemonModel;

    return Expanded(
      child: Container(
        color: Colors.teal.shade50,
        width: double.infinity,
        child: Column(
          children: [
            PokemonInfo(
              name: pokemon.name,
              mainType: pokemon.types.first,
              secondaryType: pokemon.types.last,
              typeVisible: pokemon.types.first != pokemon.types.last,
              mainAbility: pokemon.abilities.first,
              secondaryAbility: pokemon.abilities.last,
              abilityVisible: pokemon.abilities.first != pokemon.abilities.last,
              hp: pokemon.stats[0],
              attack: pokemon.stats[1],
              defense: pokemon.stats[2],
              height: pokemon.height,
              weight: pokemon.weight,
            ),
          ],
        ),
      ),
    );
  }

  Color color(context) {
    final pokemon = ModalRoute.of(context)?.settings.arguments as PokemonModel;

    switch (pokemon.types.first) {
      case 'grass':
        return Colors.green.shade200;
      case 'fire':
        return Colors.red.shade200;
      case 'water':
        return Colors.blue.shade200;
      case 'bug':
        return Colors.green.shade200;
      default:
        return Colors.grey.shade200;
    }
  }
}
