import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;

class Env {
  static Env? _instance;

  Env._();
  static Env get instance => _instance ??= Env._();

  Future<void> load() => dotenv.load();
  String? maybeet(String key) => dotenv.maybeGet(key);
  String get(String key) => dotenv.get(key);
}
