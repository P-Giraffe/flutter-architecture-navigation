import 'package:flutter/material.dart';
import 'package:flutter_avance/ui/navigation/navigation_path.dart';

class NavigationDelegate extends RouterDelegate<NavigationPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationPath> {}
