import 'package:flutter_avance/ui/screens/login_screen.dart';

class LoginViewModel extends ILoginViewModel {
  bool _isLoading = false;
  String? _emailErrorMessage;
  String? _passwordErrorMessage;
  String? _errorMessage;

  String? _email;
  String? _password;

  @override
  String? get passwordErrorMessage => _passwordErrorMessage;
  @override
  String? get emailErrorMessage => _emailErrorMessage;
  @override
  bool get isLoading => _isLoading;
  @override
  String? get errorMessage => _errorMessage;

  @override
  void emailChanged(String newEmail) {
    _email = newEmail;
    _emailErrorMessage = null;
  }

  @override
  void passwordChanged(String newPassword) {
    _password = newPassword;
    _passwordErrorMessage = null;
  }

  bool get _minimalInputIsValid =>
      _email != null &&
      _password != null &&
      _emailErrorMessage == null &&
      _passwordErrorMessage == null;

  @override
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
