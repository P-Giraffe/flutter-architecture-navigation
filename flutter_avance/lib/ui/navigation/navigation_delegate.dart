import 'package:flutter/material.dart';
import 'package:flutter_avance/data/controllers/remote_data_manager.dart';
import 'package:flutter_avance/data/model/user.dart';
import 'package:flutter_avance/data/use_cases/login_use_cases.dart';
import 'package:flutter_avance/ui/navigation/navigation_path.dart';
import 'package:flutter_avance/ui/screens/login_screen.dart';
import 'package:flutter_avance/ui/screens/login_viewmodel.dart';
import 'package:flutter_avance/ui/screens/settings_screen.dart';
import 'package:flutter_avance/ui/screens/user_home_screen.dart';
import 'package:flutter_avance/ui/screens/user_home_viewmodel.dart';

class NavigationDelegate extends RouterDelegate<NavigationPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationPath>
    implements UserHomeRouter, LoginRouter {
  final IRemoteDataManager remoteDataManager;
  User? currentUser;
  bool shouldDisplaySettings = false;
  UserHomeViewModel? homeViewModel;

  NavigationDelegate({required this.remoteDataManager});

  @override
  Widget build(BuildContext context) {
    final List<Page<dynamic>> pagesList = [];
    final homeViewModel = this.homeViewModel;
    if (homeViewModel == null) {
      final loginScreen = LoginScreen(LoginViewModel(LoginUseCases(), this));
      pagesList.add(
          MaterialPage(child: loginScreen, key: const ValueKey("LoginScreen")));
    } else {
      final homeScreen = UserHomeScreen(homeViewModel);
      pagesList.add(
          MaterialPage(child: homeScreen, key: const ValueKey("HomeScreen")));

      if (shouldDisplaySettings == true) {
        pagesList.add(const MaterialPage(
            child: SettingsScreen(),
            fullscreenDialog: true,
            key: ValueKey("SettingsScreen")));
      }
    }

    return Navigator(
      key: navigatorKey,
      pages: pagesList,
      onPopPage: (route, result) {
        if (route.didPop(result) == false) {
          return false;
        }
        return onBackButtonTouched(result);
      },
    );
  }

  bool onBackButtonTouched(dynamic result) {
    if (shouldDisplaySettings) {
      shouldDisplaySettings = false;
    }
    notifyListeners();
    return true;
  }

  @override
  NavigationPath? get currentConfiguration =>
      NavigationPath(userId: currentUser?.id);

  @override
  GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(NavigationPath configuration) async {
    final userId = configuration.userId;
    if (userId != null && currentUser == null) {
      final user = await remoteDataManager.loadCurrentUser();
      if (user != null && user.id == configuration.userId) {
        currentUser = user;
      }
    }
  }

  @override
  displaySettings() {
    shouldDisplaySettings = true;
    notifyListeners();
  }

  @override
  void displayUser(User user) {
    currentUser = user;
    homeViewModel = UserHomeViewModel(user, this, remoteDataManager);
    notifyListeners();
  }

  @override
  void logoutCurrentUser() {
    currentUser = null;
    homeViewModel = null;
    notifyListeners();
  }
}
