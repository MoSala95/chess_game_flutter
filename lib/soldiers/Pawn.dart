import '../Army.dart';
import 'I_slodier.dart';

class Pawn extends ISoldier{
  Pawn({required int position,required String color,required int id}){
    this.imagePath="assets/${Pawn}_$color.png";
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
    List<int> possibleMoves=[];
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

    if(color =="w"){
      if (downRows > 0) {
        for (int i = 1; i <= 1 ; i++) {
          print("pawn down vertical  ${this.position - (8 * i) }");
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
        /*for (int i = 1; i <= 1 ; i++) {
          print("pawn down diagonal right ${this.position - (8 * i) + i}");
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
          print("pawn down diagonal left ${this.position - (8 * i) - i}");
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

        }*/
      }
    }
    else{
      if (upRows > 0) {
        for (int i = 1; i <= 1 ; i++) {
          print("pawn vertical up ${this.position + (8 * i) }");
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
       /* for (int i = 1; i <= 1 ; i++) {
          print("pawn up rows loop ${this.position + (8 * i) + i}");
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
          print("pawn up rows loop ${this.position + (8 * i) - i}");

          if (!blackArmyPosition.contains(this.position + (8 * i) - i))
            if (!whiteArmyPosition.contains(this.position + (8 * i) - i))
              possibleMoves.add(this.position + (8 * i) - i,);
            else {
              possibleMoves.add(this.position + (8 * i) - i,);
              break;
            }
          else
            break;
        }*/
      }
    }
    this.possiblePaths=possibleMoves;
    return possibleMoves;
  }
}