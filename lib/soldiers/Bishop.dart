import 'package:chess_game_flutter/Army.dart';

import 'I_slodier.dart';

class Bishop extends ISoldier {
  Bishop({required int position, required String color, required int id}) {
    this.imagePath = "${Bishop}_$color";
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
  List<int> checkPath({ required Army whiteArmy, required Army blackArmy}) {
    // TODO: implement checkPath
    throw UnimplementedError();
  }

}
