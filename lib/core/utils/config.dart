import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get baseRoverUrl {
    var url = dotenv.env['BASE_URL'];
    return url!;
  }

  static String get apiKey {
    var key = dotenv.env['API_KEY'];
    return key!;
  }
}
