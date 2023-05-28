abstract class AppStrings {
  static String imageUrl({required int id}) =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';

  static const String goToDetails = '> Veja ficha completa';
}

extension StringCapitalizer on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
