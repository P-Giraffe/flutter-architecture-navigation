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
  });
}
