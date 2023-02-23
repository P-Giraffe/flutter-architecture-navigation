import 'package:flutter_avance/data/controllers/remote_data_manager.dart';
import 'package:flutter_avance/data/model/award.dart';
import 'package:flutter_avance/data/model/user.dart';
import 'package:flutter_avance/data/use_cases/user_awards_use_cases.dart';
import 'package:flutter_avance/ui/screens/user_home_screen.dart';

abstract class UserHomeRouter {
  displaySettings();
  void logoutCurrentUser();
}

class UserHomeViewModel extends IUserHomeViewModel {
  final User _user;
  final UserHomeRouter _router;
  final RemoteDataManager _remoteDataManager;

  UserHomeViewModel(this._user, this._router, this._remoteDataManager) {
    loadAwardList();
  }
  @override
  String get email => _user.email;
  @override
  List<Award> userAwards = [];
  @override
  bool isLoading = false;

  Future<List<Award>> loadAwardList() async {
    isLoading = true;
    notifyListeners();
    final useCase = UserAwardsUseCases(_remoteDataManager);
    userAwards = await useCase.fetchAll();
    isLoading = false;
    notifyListeners();
    return userAwards;
  }

  @override
  void userTouchedSettingsButton() {
    _router.displaySettings();
  }

  @override
  void userTouchedLogoutButton() {
    _router.logoutCurrentUser();
  }
}
