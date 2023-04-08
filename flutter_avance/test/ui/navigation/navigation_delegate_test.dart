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

    testWidgets('Displays login screen', (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (context) {
        final pagesList = sut.buildPagesList(context);
        expect(pagesList.length, 1);
        expect(pagesList[0].key, const ValueKey("LoginScreen"));
        return const SizedBox();
      }));
    });
    testWidgets('After user login', (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (context) {
        sut.displayUser(const User(23, "michael@chicagobulls.com"));
        final pagesList = sut.buildPagesList(context);
        expect(pagesList.length, 1);
        expect(pagesList[0].key, const ValueKey("UserHomeScreen"));
        return const SizedBox();
      }));
    });
  });
}
