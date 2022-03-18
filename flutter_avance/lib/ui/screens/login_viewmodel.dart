import 'package:flutter_avance/data/model/user.dart';
import 'package:flutter_avance/ui/screens/login_screen.dart';

abstract class ILoginUseCases {
  Future<User?> checkUserCredentials(String username, String password);
}

abstract class LoginRouter {
  void displayUser(User user);
}

class LoginViewModel extends ILoginViewModel {
  final LoginRouter _router;
  final ILoginUseCases _useCases;
  bool _isLoading = false;
  String? _emailErrorMessage;
  String? _passwordErrorMessage;
  String? _errorMessage;

  String? _email;
  String? _password;

  LoginViewModel(this._useCases, this._router);

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
        final user = await _useCases.checkUserCredentials(email, password);
        _isLoading = false;
        if (user != null) {
          _router.displayUser(user);
        } else {
          _errorMessage = "Impossible de retrouver votre compte";
        }

        notifyListeners();
      }
    }
  }
}
