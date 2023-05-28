class Pokemon {
  final int id;
  final String name;
  final List<String> image;
  final int height;
  final int weight;
  final List<String> abilities;
  final List<String> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.image,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.types,
  });
}
