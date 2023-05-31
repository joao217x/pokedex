import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:pokedex/shared/app_strings.dart';

class PokemonCardWidget extends StatelessWidget {
  final String name;
  final int id;
  final String type;

  const PokemonCardWidget({
    super.key,
    required this.name,
    required this.id,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: mainColor(),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _left(context),
              _right(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _left(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name.capitalize(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Container(
                decoration: BoxDecoration(
                  color: secondaryColor(),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  id < 10 ? '  #00$id  ' : '  #0$id  ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                decoration: BoxDecoration(
                  color: secondaryColor(),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  '  ${type.capitalize()}  ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _right() {
    return SizedBox(
      width: 130,
      height: 130,
      child: CachedNetworkImage(
        imageUrl: AppStrings.imageUrl(id: id),
      ),
    );
  }

  Color mainColor() {
    switch (type) {
      case 'grass':
        return Colors.green.shade100;
      case 'fire':
        return Colors.red.shade100;
      case 'water':
        return Colors.blue.shade100;
      case 'bug':
        return Colors.green.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  Color secondaryColor() {
    switch (type) {
      case 'grass':
        return Colors.green.shade300;
      case 'fire':
        return Colors.red.shade300;
      case 'water':
        return Colors.blue.shade300;
      case 'bug':
        return Colors.green.shade300;
      default:
        return Colors.grey.shade300;
    }
  }
}
