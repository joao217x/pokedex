import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:pokedex/core/app_locator.dart';
import 'package:pokedex/pokedex.dart';

Future<void> main() async {
  await setup();

  runApp(const Pokedex());
}

Future<void> setup() async {
  await dotenv.load();

  appLocator.allReady();
  AppLocator().setup();
}
