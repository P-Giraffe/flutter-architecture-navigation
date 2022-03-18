import 'package:flutter_avance/data/model/user.dart';
import 'package:flutter_avance/ui/screens/user_home_screen.dart';

abstract class UserHomeRouter {
  displaySettings();
  void logoutCurrentUser();
}

class UserHomeViewModel extends IUserHomeViewModel {
  final User _user;
  final UserHomeRouter _router;

  UserHomeViewModel(this._user, this._router);
  @override
  String get email => _user.email;

  @override
  void userTouchedSettingsButton() {
    _router.displaySettings();
  }

  @override
  void userTouchedLogoutButton() {
    _router.logoutCurrentUser();
  }
}
