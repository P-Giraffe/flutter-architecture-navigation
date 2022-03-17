import 'package:flutter_avance/data/model/user.dart';
import 'package:flutter_avance/ui/screens/login_viewmodel.dart';

class LoginUseCases implements ILoginUseCases {
  Future<User?> restoreExistingUser() {
    return Future.value(null);
  }

  @override
  Future<User?> checkUserCredentials(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (password == "ok") {
      return User(23, username);
    } else {
      return null;
    }
  }
}
