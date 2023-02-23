import 'package:flutter_avance/ui/navigation/navigation_delegate.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/controllers/mock_remote_data_manager.dart';

void main() {
  group("NavigationDelegte", () {
    late NavigationDelegate sut;
    late MockRemoteDataManager mockRemoteDataManager;

    setUp(() {
      mockRemoteDataManager = MockRemoteDataManager();
      sut = NavigationDelegate(remoteDataManager: mockRemoteDataManager);
    });
  });
}
