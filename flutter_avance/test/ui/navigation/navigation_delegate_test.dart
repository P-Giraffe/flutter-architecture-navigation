import 'package:flutter/material.dart';
import 'package:flutter_avance/data/model/user.dart';
import 'package:flutter_avance/main.dart';
import 'package:flutter_avance/ui/navigation/navigation_delegate.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/controllers/mock_remote_data_manager.dart';

void main() {
  group("NavigationDelegate", () {
    late NavigationDelegate sut;
    late MockRemoteDataManager mockRemoteDataManager;

    setUp(() {
      mockRemoteDataManager = MockRemoteDataManager();
      sut = NavigationDelegate(remoteDataManager: mockRemoteDataManager);
    });

    test("Should display settings", () {
      expect(sut.shouldDisplaySettings, false);
      sut.displaySettings();
      expect(sut.shouldDisplaySettings, true);
    });

    test(
      "Should navigate back from the settings",
      () {
        sut.shouldDisplaySettings = true;
        sut.onBackButtonTouched(null);
        expect(sut.shouldDisplaySettings, false);
      },
    );

    testWidgets('App launch should display login', (WidgetTester tester) async {
      await tester.pumpWidget(Builder(
        builder: (context) {
          final navigator = sut.build(context) as Navigator;
          final pagesList = navigator.pages;
          expect(pagesList.length, 1);
          expect(pagesList[0].key, const ValueKey("LoginScreen"));
          return const SizedBox();
        },
      ));
    });
    testWidgets('should display user home', (WidgetTester tester) async {
      await tester.pumpWidget(Builder(
        builder: (context) {
          sut.displayUser(const User(1, "michael@chicagobulls.com"));
          final navigator = sut.build(context) as Navigator;
          final pagesList = navigator.pages;
          expect(pagesList.length, 1);
          expect(pagesList[0].key, const ValueKey("HomeScreen"));
          return const SizedBox();
        },
      ));
    });

    testWidgets('should display settings', (WidgetTester tester) async {
      await tester.pumpWidget(Builder(
        builder: (context) {
          sut.displayUser(const User(1, "michael@chicagobulls.com"));
          sut.displaySettings();
          final navigator = sut.build(context) as Navigator;
          final pagesList = navigator.pages;
          expect(pagesList.length, 2);
          expect(pagesList[0].key, const ValueKey("HomeScreen"));
          expect(pagesList[1].key, const ValueKey("SettingsScreen"));
          return const SizedBox();
        },
      ));
    });
  });
}
