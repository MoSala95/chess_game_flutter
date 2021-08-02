import '../Army.dart';
import 'I_slodier.dart';

class Knight extends ISoldier{
  Knight({required int position,required String color,required int id}){
    this.imagePath="assets/${Knight}_$color.png";
    this.position=position;
    this.id=id;
  }
  @override
  void attack() {
    // TODO: implement attack
  }

  @override
  void move() {
    // TODO: implement move
  }

  @override
  List<int> checkPath({required String color,required Army whiteArmy, required Army blackArmy}){
    List<int>possibleMoves=[];
    int upRows=0;
    int downRows=0;
    int rightCells=0;
    int leftCells=0;
    int currentRow=(this.position/8).floor();

    if(this.position<8){
      rightCells=7-this.position;
      leftCells=this.position;
    }else{
      rightCells=7-this.position%8;
      leftCells=this.position%8;
    }
    print("right and left cells $rightCells ,,, $leftCells ");
    upRows=7-currentRow;
    downRows=currentRow;
    List<int> whiteArmyPosition=[];
    List<int> blackArmyPosition=[];

    whiteArmy.allSoldiers.forEach((element) {whiteArmyPosition.add(element.position); });
    blackArmy.allSoldiers.forEach((element) {blackArmyPosition.add(element.position); });

    print("current position $position current row $currentRow up row count $upRows ,, down rows $downRows");
    if(color=="w") {

      if (downRows >= 2 &&rightCells>=1) {
          print("knight up right  ${this.position - 16 +1 }");
          if (!whiteArmyPosition.contains(this.position - 16 +1 ))
            if (!blackArmyPosition.contains(this.position - 16 +1 ))
              possibleMoves.add(this.position - 16 + 1 );
            else {
              possibleMoves.add(this.position - 16+ 1  );
            }
      }
      if (downRows >= 2 &&leftCells>=1) {
        print("knight up left  ${this.position - 16 -1 }");
        if (!whiteArmyPosition.contains(this.position - 16 -1 ))
          if (!blackArmyPosition.contains(this.position - 16 -1 ))
            possibleMoves.add(this.position - 16 - 1 );
          else {
            possibleMoves.add(this.position - 16- 1  );
          }
      }
      if (downRows >= 1 &&rightCells>=2) {
        print("knight right up   ${this.position - 8 +2 }");
        if (!whiteArmyPosition.contains(this.position - 8 +2 ))
          if (!blackArmyPosition.contains(this.position - 8 +2 ))
            possibleMoves.add(this.position - 8 + 2 );
          else {
            possibleMoves.add(this.position - 8+ 2  );
          }
      }
      if (downRows >= 1 &&leftCells>=2) {
        print("knight left up  ${this.position - 8 -2 }");
        if (!whiteArmyPosition.contains(this.position - 8 -2 ))
          if (!blackArmyPosition.contains(this.position - 8 -2 ))
            possibleMoves.add(this.position - 8 -2 );
          else {
            possibleMoves.add(this.position - 8-2 );
          }
      }


      ///todo
      if (upRows >= 2 &&rightCells>=1) {
        print("knight down right  ${this.position + 16 +1 }");
        if (!whiteArmyPosition.contains(this.position + 16 +1 ))
          if (!blackArmyPosition.contains(this.position + 16 +1 ))
            possibleMoves.add(this.position + 16 + 1 );
          else {
            possibleMoves.add(this.position + 16+ 1  );
          }
      }
      if (upRows >= 2 &&leftCells>=1) {
        print("knight down left  ${this.position + 16 -1 }");
        if (!whiteArmyPosition.contains(this.position + 16 -1 ))
          if (!blackArmyPosition.contains(this.position + 16 -1 ))
            possibleMoves.add(this.position + 16 - 1 );
          else {
            possibleMoves.add(this.position + 16- 1  );
          }
      }
      if (upRows >= 1 &&rightCells>=2) {
        print("knight right down   ${this.position + 8 +2 }");
        if (!whiteArmyPosition.contains(this.position + 8 +2 ))
          if (!blackArmyPosition.contains(this.position + 8 +2 ))
            possibleMoves.add(this.position + 8 + 2 );
          else {
            possibleMoves.add(this.position + 8+ 2  );
          }
      }
      if (upRows >= 1 &&leftCells>=2) {
        print("knight left down  ${this.position + 8 -2 }");
        if (!whiteArmyPosition.contains(this.position + 8 -2) )
          if (!blackArmyPosition.contains(this.position + 8 -2 ))
            possibleMoves.add(this.position + 8 -2 );
          else {
            possibleMoves.add(this.position + 8-2  );
          }
      }

    }
    else{
      if (downRows >= 2 &&rightCells>=1) {
        print("knight up right  ${this.position - 16 +1 }");
        if (!blackArmyPosition.contains(this.position - 16 +1 ))
          if (!whiteArmyPosition.contains(this.position - 16 +1 ))
            possibleMoves.add(this.position - 16 + 1 );
          else {
            possibleMoves.add(this.position - 16+ 1  );
          }
      }
      if (downRows >= 2 &&leftCells>=1) {
        print("knight up left  ${this.position - 16 -1 }");
        if (!blackArmyPosition.contains(this.position - 16 -1 ))
          if (!whiteArmyPosition.contains(this.position - 16 -1 ))
            possibleMoves.add(this.position - 16 - 1 );
          else {
            possibleMoves.add(this.position - 16- 1  );
          }
      }
      if (downRows >= 1 &&rightCells>=2) {
        print("knight right up   ${this.position - 8 +2 }");
        if (!blackArmyPosition.contains(this.position - 8 +2 ))
          if (!whiteArmyPosition.contains(this.position - 8 +2 ))
            possibleMoves.add(this.position - 8 + 2 );
          else {
            possibleMoves.add(this.position - 8+ 2  );
          }
      }
      if (downRows >= 1 &&leftCells>=2) {
        print("knight left up  ${this.position - 8 -2 }");
        if (!blackArmyPosition.contains(this.position - 8 -2 ))
          if (!whiteArmyPosition.contains(this.position - 8 -2 ))
            possibleMoves.add(this.position - 8 -2 );
          else {
            possibleMoves.add(this.position - 8-2 );
          }
      }


      ///todo
      if (upRows >= 2 &&rightCells>=1) {
        print("knight down right  ${this.position + 16 +1 }");
        if (!blackArmyPosition.contains(this.position + 16 +1 ))
          if (!whiteArmyPosition.contains(this.position + 16 +1 ))
            possibleMoves.add(this.position + 16 + 1 );
          else {
            possibleMoves.add(this.position + 16+ 1  );
          }
      }
      if (upRows >= 2 &&leftCells>=1) {
        print("knight down left  ${this.position + 16 -1 }");
        if (!blackArmyPosition.contains(this.position + 16 -1 ))
          if (!whiteArmyPosition.contains(this.position + 16 -1 ))
            possibleMoves.add(this.position + 16 - 1 );
          else {
            possibleMoves.add(this.position + 16- 1  );
          }
      }
      if (upRows >= 1 &&rightCells>=2) {
        print("knight right down   ${this.position + 8 +2 }");
        if (!blackArmyPosition.contains(this.position + 8 +2 ))
          if (!whiteArmyPosition.contains(this.position + 8 +2 ))
            possibleMoves.add(this.position + 8 + 2 );
          else {
            possibleMoves.add(this.position + 8+ 2  );
          }
      }
      if (upRows >= 1 &&leftCells>=2) {
        print("knight left down  ${this.position + 8 -2 }");
        if (!blackArmyPosition.contains(this.position + 8 -2) )
          if (!whiteArmyPosition.contains(this.position + 8 -2 ))
            possibleMoves.add(this.position + 8 -2 );
          else {
            possibleMoves.add(this.position + 8-2  );
          }
      }
    }
    this.possiblePaths=possibleMoves;
    return possibleMoves;
  }

}