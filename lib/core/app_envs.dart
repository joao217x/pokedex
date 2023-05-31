import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppEnvs {
  static String apiUrl = dotenv.get('API_URL');
}
