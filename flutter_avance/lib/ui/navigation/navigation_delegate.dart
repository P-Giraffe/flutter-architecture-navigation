import 'package:flutter/material.dart';
import 'package:flutter_avance/data/controllers/remote_data_manager.dart';
import 'package:flutter_avance/data/model/user.dart';
import 'package:flutter_avance/data/use_cases/login_use_cases.dart';
import 'package:flutter_avance/ui/navigation/navigation_path.dart';
import 'package:flutter_avance/ui/screens/login_screen.dart';
import 'package:flutter_avance/ui/screens/login_viewmodel.dart';
import 'package:flutter_avance/ui/screens/user_home_screen.dart';
import 'package:flutter_avance/ui/screens/user_home_viewmodel.dart';

class NavigationDelegate extends RouterDelegate<NavigationPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationPath> {
  final RemoteDataManager _remoteDataManager = RemoteDataManager();
  User? _currentUser;

  @override
  Widget build(BuildContext context) {
    final List<Page<dynamic>> pagesList = [];
    final user = _currentUser;
    if (user != null) {
      final homeScreen = UserHomeScreen(UserHomeViewModel(user));
      pagesList.add(MaterialPage(child: homeScreen));
    } else {
      final loginScreen = LoginScreen(LoginViewModel(LoginUseCases()));
      pagesList.add(MaterialPage(child: loginScreen));
    }

    return Navigator(
      pages: pagesList,
    );
  }

  @override
  NavigationPath? get currentConfiguration =>
      NavigationPath(userId: _currentUser?.id);

  @override
  GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(NavigationPath configuration) async {
    final userId = configuration.userId;
    if (userId != null && _currentUser == null) {
      final currentUser = await _remoteDataManager.loadCurrentUser();
      if (currentUser != null && currentUser.id == configuration.userId) {
        _currentUser = currentUser;
      }
    }
  }
}
