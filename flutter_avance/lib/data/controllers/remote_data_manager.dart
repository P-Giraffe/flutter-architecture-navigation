import 'package:flutter_avance/data/model/award.dart';
import 'package:flutter_avance/data/model/user.dart';

class RemoteDataManager {
  Future<User?> loadCurrentUser() {
    return Future.value(const User(23, "michael@chicagobulls.com"));
  }

  Future<List<Award>> awardList() {
    return Future.value(const [
      Award("Rookie de l'année", 1984),
      Award("Rookie de l'année", 1985),
      Award("Champion NBA", 1991),
      Award("MVP des finales NBA", 1991),
      Award("Champion NBA", 1992),
      Award("MVP des finales NBA", 1992),
      Award("Champion NBA", 1993),
      Award("MVP des finales NBA", 1993),
      Award("Champion NBA", 1996),
      Award("MVP des finales NBA", 1996),
      Award("Champion NBA", 1997),
      Award("MVP des finales NBA", 1997),
      Award("Champion NBA", 1998),
      Award("MVP des finales NBA", 1998),
    ]);
  }
}
