import 'I_slodier.dart';

class Pawn extends ISoldier {
  late bool isFirst = true;
  Pawn({required int position, required String color, required int id}) {
    this.imagePath = "${Pawn}_$color";
    this.position = position;
    this.id = id;
    this.color = color;
  }

  @override
  bool move({required int currentIndex, required int newIndex}) {
    /*
      if army is white => check if (box of currentIndex - 8 is empty) => move
      else if army is black => check if (box of currentIndex + 8 is empty) => move
    */
    print("color: $color - currentIndex: $currentIndex - newIndex: $newIndex ");
    if ((isFirst == true && color == "w" && currentIndex - newIndex == 16) ||
        (isFirst == true && color == "b" && newIndex - currentIndex == 16) ||
        (color == "w" && currentIndex - newIndex == 8) ||
        (color == "b" && newIndex - currentIndex == 8)) {
      this.isFirst = false;
      return true;
    }
    return false;
  }

  @override
  bool attack({required ISoldier attackedSoldier}) {
    /*
    if army is white => check if (box of currentIndex - newIndex ==  7 | 9) => attack
      else if army is black check if (box of newIndex - currentIndex ==  7 | 9) => attack
   */
    if ((color == "w" &&
            attackedSoldier.color == "b" &&
            ((position - attackedSoldier.position == 7) ||
                (position - attackedSoldier.position == 9))) ||
        (color == "b" &&
            ((attackedSoldier.position - position == 7) ||
                (attackedSoldier.position - position == 9)))) {
      return true;
    }
    return false;
  }
}
