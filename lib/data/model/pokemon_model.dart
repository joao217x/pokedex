import 'package:pokedex/domain/entity/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required super.id,
    required super.name,
    required super.height,
    required super.weight,
    required super.abilities,
    required super.types,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    final abilities = json['abilities'] as List;
    final types = json['types'] as List;

    return PokemonModel(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      abilities: abilities
          .map((ability) => ability['ability']['name'] as String)
          .toList(),
      types: types.map((type) => type['type']['name'] as String).toList(),
    );
  }
}
