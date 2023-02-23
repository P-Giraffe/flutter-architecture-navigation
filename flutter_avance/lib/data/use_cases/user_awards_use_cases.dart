import 'package:flutter_avance/data/controllers/remote_data_manager.dart';
import 'package:flutter_avance/data/model/award.dart';

class UserAwardsUseCases {
  final IRemoteDataManager _remoteDataManager;

  UserAwardsUseCases(this._remoteDataManager);

  Future<List<Award>> fetchAll() async {
    return _remoteDataManager.awardList();
  }
}
