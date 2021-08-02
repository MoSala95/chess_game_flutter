import 'package:chess_game_flutter/Army.dart';

import 'I_slodier.dart';

class Knight extends ISoldier {
  Knight({required int position, required String color, required int id}) {
    this.imagePath = "${Knight}_$color";
    this.position = position;
    this.id = id;
    this.color = color;
  }

  @override
  bool move({required int currentIndex, required int newIndex}) {
    // TODO: implement move
    throw UnimplementedError();
  }

  @override
  bool attack({required ISoldier attackedSoldier}) {
    // TODO: implement attack
    throw UnimplementedError();
  }

  @override
  List<int> checkPath({required Army whiteArmy, required Army blackArmy}) {
    List<int> availableIndexes = [];
    Map<String, int> _supposedDirections = {
      "bottomRight": (position + 16 + 1),
      "bottomLeft": (position + 16 - 1),
      "topLeft": (position - 16 - 1),
      "topRight": (position - 16 + 1),
      "rightTop": (position + 2 - 8),
      "rightBottom": (position + 2 + 8),
      "leftTop": (position - 2 - 8),
      "leftBottom": (position - 2 + 8)
    };
    print("supposedIndexes: $_supposedDirections");
    if ((position < 8 && 8 - position <= 2) || (position % 8 >= 6)) {
      _supposedDirections.remove('rightTop');
      _supposedDirections.remove('rightBottom');
      if (position % 8 == 7) {
        _supposedDirections.remove('topRight');
        _supposedDirections.remove('topLeft');
      }
    } else if ((position < 8 && 8 - position >= 7) || (position % 8 <= 1)) {
      _supposedDirections.remove('leftTop');
      _supposedDirections.remove('leftBottom');
      if (position % 8 == 0) {
        _supposedDirections.remove('topLeft');
        _supposedDirections.remove('bottomLeft');
      }
    }
    for (var key in _supposedDirections.keys) {
      int? _indexFoundInWightArmy = whiteArmy.allSoldiers.indexWhere(
          (ISoldier solider) => solider.position == _supposedDirections[key]!);
      int? _indexFoundInBlackArmy = blackArmy.allSoldiers.indexWhere(
          (ISoldier solider) => solider.position == _supposedDirections[key]!);
      if ((_indexFoundInWightArmy == -1 && _indexFoundInBlackArmy == -1) ||
          (color == "w" && _indexFoundInBlackArmy > -1)) {
        availableIndexes.add(_supposedDirections[key]!);
      }
    }
    return availableIndexes;
  }
}
