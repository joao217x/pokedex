import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/shared/app_strings.dart';

class PokemonCard extends StatelessWidget {
  final String name;
  final int id;
  final String type;

  const PokemonCard({
    super.key,
    required this.name,
    required this.id,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 110,
                child: Column(
                  children: [
                    Text(
                      name.capitalize(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(type),
                  ],
                ),
              ),
              const VerticalDivider(thickness: 3),
              SizedBox(
                width: 120,
                height: 120,
                child: CachedNetworkImage(
                  imageUrl: AppStrings.imageUrl(id: id),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
