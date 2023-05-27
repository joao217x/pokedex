import 'package:flutter/material.dart';

import 'package:pokedex/shared/theme/text_theme_data.dart';

class AppThemeData {
  static ThemeData theme(context) {
    return ThemeData(
      textTheme: TextThemeData.theme,
    );
  }
}
