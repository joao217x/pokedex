import 'package:flutter/material.dart';

import 'package:pokedex/presentation/details/view/details_screen.dart';
import 'package:pokedex/presentation/home/view/home_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes(context) {
    return {
      '/home': (context) => HomeScreen(),
      '/details': (context) => const DetailsScreen(),
    };
  }
}
