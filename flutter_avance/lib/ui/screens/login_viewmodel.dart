import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _emailErrorMessage;
  String? _passwordErrorMessage;
  String? _errorMessage;

  String? _email;
  String? _password;

  String? get passwordErrorMessage => _passwordErrorMessage;
  String? get emailErrorMessage => _emailErrorMessage;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void emailChanged(String newEmail) {
    _email = newEmail;
    _emailErrorMessage = null;
  }

  void passwordChanged(String newPassword) {
    _password = newPassword;
    _passwordErrorMessage = null;
  }

  bool get _minimalInputIsValid =>
      _email != null &&
      _password != null &&
      _emailErrorMessage == null &&
      _passwordErrorMessage == null;

  void loginUser() async {
    final email = _email;
    final password = _password;
    if (email != null && password != null) {
      if (email.contains("@") == false) {
        _emailErrorMessage = "Email invalide";
        notifyListeners();
      }
      if (password.isEmpty) {
        _passwordErrorMessage = "Mot de passe invalide";
        notifyListeners();
      }
      if (_minimalInputIsValid) {
        _isLoading = true;
        notifyListeners();
        await Future.delayed(const Duration(seconds: 2));
        _isLoading = false;
        _errorMessage = password == "ok"
            ? "Bienvenue $email"
            : "Impossible de retrouver votre compte";
        notifyListeners();
      }
    }
  }
}
