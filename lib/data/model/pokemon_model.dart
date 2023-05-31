import 'package:pokedex/domain/entity/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required super.id,
    required super.name,
    required super.types,
    required super.abilities,
    required super.stats,
    required super.height,
    required super.weight,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    final types = json['types'] as List;
    final abilities = json['abilities'] as List;
    final stats = json['stats'] as List;

    return PokemonModel(
      id: json['id'],
      name: json['name'],
      types: types.map((type) => type['type']['name'] as String).toList(),
      abilities: abilities
          .map((ability) => ability['ability']['name'] as String)
          .toList(),
      stats: stats.map((stat) => stat['base_stat'] as int).toList(),
      height: json['height'],
      weight: json['weight'],
    );
  }
}
