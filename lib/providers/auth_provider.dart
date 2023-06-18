import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utilities/app_storage_keys.dart';

class AuthProvider with ChangeNotifier {
  String? _token;

  Future<void> saveUser({required String token}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _token = token;
    if (kDebugMode) {
      print(' =========== token : ${_token!}');
    }
    preferences.setString(AppStorageKeys.token, _token!);
    notifyListeners();
  }

  bool _isLoggedIn = false;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  bool get isLoggedIn => _isLoggedIn;

  set isAuthState(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  Future<bool> checkAuthState() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString(AppStorageKeys.token) != null) {
      isLoggedIn = true;
    }
    return isLoggedIn;
  }
}
