import 'package:flutter/material.dart';
import 'package:greatedays/src/utils/local_storage.dart';

class AuthProvider extends ChangeNotifier {
  late LocalStorage _local;

  AuthProvider() {
    _local = LocalStorage();

    /*
    *  TEST !
    */
    _local.clearToken();
  }

  //
  bool get isAuth => _local.refreshToken.isNotEmpty;
  // bool get isAuth => true;

  //
  Future<void> storeToken(String token) async {
    _local.setRefreshToken(token);
    notifyListeners();
  }
}
