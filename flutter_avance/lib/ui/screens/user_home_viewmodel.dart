import 'package:flutter_avance/data/model/user.dart';
import 'package:flutter_avance/ui/screens/user_home_screen.dart';

class UserHomeViewModel extends IUserHomeViewModel {
  final User _user;

  UserHomeViewModel(this._user);
  @override
  String get email => _user.email;
}
