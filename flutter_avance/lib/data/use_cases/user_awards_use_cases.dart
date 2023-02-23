import 'package:flutter_avance/data/controllers/remote_data_manager.dart';
import 'package:flutter_avance/data/model/award.dart';

class UserAwardsUseCases {
  final RemoteDataManager _remoteDataManager;

  UserAwardsUseCases(this._remoteDataManager);

  Future<List<Award>> fetchAll() async {
    await Future.delayed(const Duration(seconds: 1));
    return _remoteDataManager.awardList();
  }
}
