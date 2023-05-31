class Pokemon {
  final int id;
  final String name;
  final List<String> types;
  final List<String> abilities;
  final List<int> stats;
  final int height;
  final int weight;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.abilities,
    required this.stats,
    required this.height,
    required this.weight,
  });
}
