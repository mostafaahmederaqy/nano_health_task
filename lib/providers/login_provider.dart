

import 'package:flutter/material.dart';
import 'package:nano_health_task/services/auth_service.dart';
import 'package:provider/provider.dart';
import '../models/login_model.dart';
import '../utilities/api_status.dart';
import 'auth_provider.dart';

class LoginProvider extends ChangeNotifier {

  final Locator read;
  LoginProvider(this.read);



  final GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<FormState> get formKey => _formKey;

  bool _passwordVisible=false;


  bool get passwordVisible => _passwordVisible;



  set passwordVisible(bool value) {
    _passwordVisible = value;
    notifyListeners();
  }

  changeVisibility(){
    passwordVisible=!passwordVisible;
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String? _userError;


  String? get userError => _userError;

  set userError(String? value) {
    _userError = value;
    notifyListeners();
  }

  Future login() async {
    isLoading = true;
    final response = await AuthService().loginApi(
      password: passwordController.text, email: emailController.text,
    );

    if (response is Success) {
      final loginResponse = response.response as LoginModel;
      print(loginResponse);
      notifyListeners();
      await read<AuthProvider>().saveUser(token: loginResponse.token);
      isLoading = false;
    } else if (response is Failure) {
      print(response.errorResponse);
      userError = response.errorResponse as String?;
      isLoading = false;
    }
    isLoading = false;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}