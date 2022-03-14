import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  String? _email;
  String? _password;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void emailChanged(String newEmail) {
    _email = newEmail;
  }

  void passwordChanged(String newPassword) {
    _password = newPassword;
  }

  void loginUser() {
    final email = _email;
    final password = _password;
    if (email != null && password != null) {
      _isLoading = true;
      _errorMessage = "Login attempt with $email and $password";
      notifyListeners();
    }
  }
}
