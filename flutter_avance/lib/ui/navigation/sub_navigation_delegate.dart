import 'package:flutter/material.dart';

abstract class IMainRouter {
  childRouterDidChange();
  wizardWasFinishedByTheUser();
}

class SubNavigationDelegate {
  final IMainRouter mainRouter;

  SubNavigationDelegate(this.mainRouter);
  List<Page<dynamic>> buildPageList(BuildContext context) {
    return [];
  }

  bool onBackButtonTouched(dynamic result) {
    return true;
  }
}
