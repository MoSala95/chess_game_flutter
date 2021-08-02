import 'package:chess_game_flutter/Army.dart';

import 'I_slodier.dart';

class King extends ISoldier {
  King({required int position, required String color, required int id}) {
    this.imagePath = "${King}_$color";
    this.position = position;
    this.id = id;
    this.color = color;
  }

  @override
  bool move({required int currentIndex, required int newIndex}) {
    if ((currentIndex - newIndex).abs() == 1 ||
        (currentIndex - newIndex).abs() == 8) {
      return true;
    }
    return false;
  }

  @override
  bool attack({required ISoldier attackedSoldier}) {
    // TODO: implement attack
    throw UnimplementedError();
  }

  @override
  List<int> checkPath({required Army whiteArmy, required Army blackArmy}) {
    List<int> availableIndexes = [];
    List<int> supposedIndexes = [
      (position + 1),
      (position - 1),
      (position + 7),
      (position - 7),
      (position + 8),
      (position - 8),
      (position + 9),
      (position - 9)
    ];
    if (position % 8 == 7) {
      supposedIndexes.removeWhere((element) => element % 8 == 0);
    } else if (position % 8 == 0) {
      supposedIndexes.removeWhere((element) => element % 8 == 7);
    } else {
      supposedIndexes.removeWhere((element) => element < 0 || element > 63);
    }

    for (var i = 0; i < supposedIndexes.length; i++) {
      int? _indexFoundInWightArmy = whiteArmy.allSoldiers.indexWhere(
          (ISoldier solider) => solider.position == supposedIndexes[i]);
      int? _indexFoundInBlackArmy = blackArmy.allSoldiers.indexWhere(
          (ISoldier solider) => solider.position == supposedIndexes[i]);
      if ((_indexFoundInWightArmy == -1 && _indexFoundInBlackArmy == -1) ||
          (color == "w" && _indexFoundInBlackArmy > -1)) {
        availableIndexes.add(supposedIndexes[i]);
      }
    }

    return availableIndexes;
  }
}
