import 'package:greatedays/src/enum/shared_preference_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._init();
  static final LocalStorage _instance = LocalStorage._init();
  factory LocalStorage() => _instance;

  late final SharedPreferences _store;

  Future<void> ready() async {
    _store = await SharedPreferences.getInstance();
  }

  /*
  *
  * Auth - refreshToken
  */
  final String _refreshTokenKey = PreferenceKey.refreshToken.toString();
  String get refreshToken => _store.getString(_refreshTokenKey) ?? '';

  Future<String> setRefreshToken(String token) async {
    await _store.setString(_refreshTokenKey, token);
    return token;
  }

  Future<void> clearToken() async {
    await _store.remove(_refreshTokenKey);
  }
}
