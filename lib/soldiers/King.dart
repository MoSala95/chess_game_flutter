import '../Army.dart';
import 'I_slodier.dart';

class King extends ISoldier{
  King({required int position,required String color,required int id}){
    this.imagePath="assets/${King}_$color.png";
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
      if(rightCells>0){
        for (int i = 1; i <= 1 ; i++) {
          print("king right ${this.position + i }");
          if (!whiteArmyPosition.contains(this.position + i ))
            if (!blackArmyPosition.contains(this.position +  i ))
              possibleMoves.add(this.position +  i );
            else {
              possibleMoves.add(this.position +  i );
              break;
            }
          else{
            print("break white loop");
            break;
          }

        }
      }
      if(leftCells>0){
        for (int i = 1; i <= 1 ; i++) {
          print("king left  ${this.position - i }");
          if (!whiteArmyPosition.contains(this.position - i ))
            if (!blackArmyPosition.contains(this.position -  i ))
              possibleMoves.add(this.position -  i );
            else {
              possibleMoves.add(this.position -  i );
              break;
            }
          else{
            print("break white loop");
            break;
          }

        }
      }
      if (downRows > 0) {
        for (int i = 1; i <= 1 ; i++) {
          print("king down vertical  ${this.position - (8 * i) }");
          if (!whiteArmyPosition.contains(this.position - (8 * i) ))
            if (!blackArmyPosition.contains(this.position - (8 * i) ))
              possibleMoves.add(this.position - (8 * i) );
            else {
              possibleMoves.add(this.position - (8 * i) );
              break;
            }
          else{
            print("break white loop");
            break;
          }

        }
        for (int i = 1; i <= 1 ; i++) {
          print("king down diagonal right ${this.position - (8 * i) + i}");
          if (!whiteArmyPosition.contains(this.position - (8 * i) + i))
            if (!blackArmyPosition.contains(this.position - (8 * i) + i))
              possibleMoves.add(this.position - (8 * i) + i,);
            else {
              possibleMoves.add(this.position - (8 * i) + i,);
              break;
            }
          else{
            print("break white loop");
            break;
          }

        }
        for (int i = 1; i <= 1 ; i++) {
          print("king down diagonal left ${this.position - (8 * i) - i}");
          if (!whiteArmyPosition.contains(this.position - (8 * i) - i))
            if (!blackArmyPosition.contains(this.position - (8 * i) - i))
              possibleMoves.add(this.position - (8 * i) - i,);
            else {
              possibleMoves.add(this.position - (8 * i) - i,);
              break;
            }
          else{
            print("break white loop");
            break;
          }

        }
      }


      if (upRows > 0) {
        for (int i = 1; i <= 1 ; i++) {
          print("king up vertical ${this.position + (8 * i) }");

          if (!whiteArmyPosition.contains(this.position + (8 * i) ))
            if (!blackArmyPosition.contains(this.position + (8 * i) ))
              possibleMoves.add(this.position + (8 * i) );
            else {
              possibleMoves.add(this.position + (8 * i) );
              break;
            }
          else
            break;
        }
        for (int i = 1; i <= 1 ; i++) {
          print("king down diagonal right ${this.position + (8 * i) + i}");

          if (!whiteArmyPosition.contains(this.position + (8 * i) + i))
            if (!blackArmyPosition.contains(this.position + (8 * i) + i))
              possibleMoves.add(this.position + (8 * i) + i,);
            else {
              possibleMoves.add(this.position + (8 * i) + i,);
              break;
            }
          else
            break;
        }
        for (int i = 1; i <= 1 ; i++) {
          print("king down diagonal left ${this.position + (8 * i) - i}");
          if (!whiteArmyPosition.contains(this.position + (8 * i) - i))
            if (!blackArmyPosition.contains(this.position + (8 * i) - i))
              possibleMoves.add(this.position + (8 * i) - i,);
            else {
              possibleMoves.add(this.position + (8 * i) - i,);
              break;
            }
          else
            break;
        }
      }
    }else{
      if(rightCells>0){
        for (int i = 1; i <= 1 ; i++) {
          print("king right  ${this.position + i }");
          if (!blackArmyPosition.contains(this.position + i ))
            if (!whiteArmyPosition.contains(this.position +  i ))
              possibleMoves.add(this.position +  i );
            else {
              possibleMoves.add(this.position +  i );
              break;
            }
          else{
            print("break white loop");
            break;
          }

        }
      }
      if(leftCells>0){
        for (int i = 1; i <= 1 ; i++) {
          print("king left  ${this.position - i }");
          if (!blackArmyPosition.contains(this.position - i ))
            if (!whiteArmyPosition.contains(this.position -  i ))
              possibleMoves.add(this.position -  i );
            else {
              possibleMoves.add(this.position -  i );
              break;
            }
          else{
            print("break white loop");
            break;
          }

        }
      }
      if (downRows > 0) {
        for (int i = 1; i <= 1 ; i++) {
          print("king vertical down ${this.position - (8 * i) }");
          if (!blackArmyPosition.contains(this.position - (8 * i) ))
            if (!whiteArmyPosition.contains(this.position - (8 * i) ))
              possibleMoves.add(this.position - (8 * i) + i,);
            else {
              possibleMoves.add(this.position - (8 * i) + i,);
              break;
            }
          else
            break;
        }
        for (int i = 1; i <= 1 ; i++) {
          print("king down rows loop ${this.position - (8 * i) + i}");
          if (!blackArmyPosition.contains(this.position - (8 * i) + i))
            if (!whiteArmyPosition.contains(this.position - (8 * i) + i))
              possibleMoves.add(this.position - (8 * i) + i,);
            else {
              possibleMoves.add(this.position - (8 * i) + i,);
              break;
            }
          else
            break;
        }
        for (int i = 1; i <= 1 ; i++) {
          print("king down rows loop ${this.position - (8 * i) - i}");
          if (!blackArmyPosition.contains(this.position - (8 * i) - i))
            if (!whiteArmyPosition.contains(this.position - (8 * i) - i))
              possibleMoves.add(this.position - (8 * i) - i,);
            else {
              possibleMoves.add(this.position - (8 * i) - i,);
              break;
            }
          else
            break;
        }
      }


      if (upRows > 0) {
        for (int i = 1; i <= 1 ; i++) {
          print("king vertical up ${this.position + (8 * i) }");
          if (!blackArmyPosition.contains(this.position + (8 * i) ))
            if (!whiteArmyPosition.contains(this.position + (8 * i) ))
              possibleMoves.add(this.position + (8 * i) + i,);
            else {
              possibleMoves.add(this.position + (8 * i) + i,);
              break;
            }
          else
            break;
        }
        for (int i = 1; i <= 1 ; i++) {
          print("king up rows loop ${this.position + (8 * i) + i}");
          if (!blackArmyPosition.contains(this.position + (8 * i) + i))
            if (!whiteArmyPosition.contains(this.position + (8 * i) + i))
              possibleMoves.add(this.position + (8 * i) + i,);
            else {
              possibleMoves.add(this.position + (8 * i) + i,);
              break;
            }
          else
            break;
        }
        for (int i = 1; i <= 1 ; i++) {
          print("king up rows loop ${this.position + (8 * i) - i}");

          if (!blackArmyPosition.contains(this.position + (8 * i) - i))
            if (!whiteArmyPosition.contains(this.position + (8 * i) - i))
              possibleMoves.add(this.position + (8 * i) - i,);
            else {
              possibleMoves.add(this.position + (8 * i) - i,);
              break;
            }
          else
            break;
        }
      }
    }
    this.possiblePaths=possibleMoves;
    return possibleMoves;
  }

}