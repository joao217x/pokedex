import 'package:flutter/material.dart';

import 'package:pokedex/shared/app_strings.dart';

class PokemonInfo extends StatelessWidget {
  final String name;
  final String mainType;
  final String secondaryType;
  final bool typeVisible;
  final String mainAbility;
  final String secondaryAbility;
  final bool abilityVisible;
  final int hp;
  final int attack;
  final int defense;
  final int height;
  final int weight;

  const PokemonInfo({
    super.key,
    required this.name,
    required this.mainType,
    required this.secondaryType,
    required this.typeVisible,
    required this.mainAbility,
    required this.secondaryAbility,
    required this.abilityVisible,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.teal.shade50,
        width: double.infinity,
        child: Column(
          children: [
            Text(
              name.capitalize(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            _details(context),
          ],
        ),
      ),
    );
  }

  Widget _details(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _mainType(context),
          Divider(thickness: 2, color: Colors.grey.shade400),
          _secondaryType(context),
          _mainAbility(context),
          Divider(thickness: 2, color: Colors.grey.shade400),
          _secondaryAbility(context),
          _hp(context),
          Divider(thickness: 2, color: Colors.grey.shade400),
          _attack(context),
          Divider(thickness: 2, color: Colors.grey.shade400),
          _defense(context),
          Divider(thickness: 2, color: Colors.grey.shade400),
          _height(context),
          Divider(thickness: 2, color: Colors.grey.shade400),
          _weight(context),
        ],
      ),
    );
  }

  Widget _mainType(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Main type: '),
        Text(
          mainType.capitalize(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _secondaryType(context) {
    return Visibility(
      visible: typeVisible,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Secondary type: '),
              Text(
                secondaryType.capitalize(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          Divider(thickness: 2, color: Colors.grey.shade400),
        ],
      ),
    );
  }

  Widget _mainAbility(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Main ability: '),
        Text(
          mainAbility.capitalize(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _secondaryAbility(context) {
    return Visibility(
      visible: abilityVisible,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Secondary ability: '),
              Text(
                secondaryAbility.capitalize(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          Divider(thickness: 2, color: Colors.grey.shade400),
        ],
      ),
    );
  }

  Widget _hp(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('HP: '),
        Text(
          hp.toString(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _attack(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Attack: '),
        Text(
          attack.toString(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _defense(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Defense: '),
        Text(
          defense.toString(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _height(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Height: '),
        Text(
          height.toString(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _weight(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Weight: '),
        Text(
          weight.toString(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
