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
  checkPath({required String color,required Army friend, required Army enemy}){
    List<int> possibleMoves=[];
    List<int>possibleAttacks=[];
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
    List<int> friendArmyPosition=[];
    List<int> enemyArmyPosition=[];

    friend.allSoldiers.forEach((element) {friendArmyPosition.add(element.position); });
    enemy.allSoldiers.forEach((element) {enemyArmyPosition.add(element.position); });

      if (downRows > 0&&color=="w") {

          print("pawn down vertical  ${this.position - 8 }");
          if (!friendArmyPosition.contains(this.position - 8 ))
            if (!enemyArmyPosition.contains(this.position - 8 ))
              possibleMoves.add(this.position - 8 );



          print("pawn down diagonal right ${this.position - 8 + 1}");
          if (!friendArmyPosition.contains(this.position - 8 + 1))
            if (enemyArmyPosition.contains(this.position - 8 + 1))
              possibleAttacks.add(this.position - 8 + 1,);


          print("pawn down diagonal left ${this.position - 8-1}");
          if (!friendArmyPosition.contains(this.position - 8-1))
            if (enemyArmyPosition.contains(this.position - 8-1))
              possibleAttacks.add(this.position - 8-1,);

      }
    if (upRows > 0 && color=="b") {
      print("pawn up vertical  ${this.position + 8 }");
      if (!friendArmyPosition.contains(this.position + 8 ))
        if (!enemyArmyPosition.contains(this.position + 8 ))
          possibleMoves.add(this.position + 8 );

      print("pawn up diagonal right ${this.position + 8 + 1}");
      if (!friendArmyPosition.contains(this.position + 8 + 1))
        if (enemyArmyPosition.contains(this.position + 8 + 1))
          possibleAttacks.add(this.position + 8 + 1,);


      print("pawn up diagonal left ${this.position + 8-1}");
      if (!friendArmyPosition.contains(this.position + 8-1))
        if (enemyArmyPosition.contains(this.position + 8-1))
          possibleAttacks.add(this.position + 8-1,);

    }
    
     
    this.possiblePaths=possibleMoves;
    this.possibleAttacks=possibleAttacks;
  }
}