import 'package:flutter/material.dart';

import 'package:pokedex/core/app_routes.dart';
import 'package:pokedex/shared/theme/app_theme_data.dart';

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.theme(context),
      initialRoute: '/home',
      routes: AppRoutes.routes(context),
    );
  }
}
