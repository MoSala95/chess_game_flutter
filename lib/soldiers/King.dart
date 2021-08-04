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
  checkPath({required String color,required Army friend, required Army enemy}){
    List<int>possibleMoves=[];
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

    print("current position $position current row $currentRow up row count $upRows ,, down rows $downRows");
      if(rightCells>0){
        for (int i = 1; i <= 1 ; i++) {
          print("king right ${this.position + i }");
          if (!friendArmyPosition.contains(this.position + i ))
            if (!enemyArmyPosition.contains(this.position +  i ))
              possibleMoves.add(this.position +  i );
            else {

              possibleAttacks.add(this.position +  i );

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
          if (!friendArmyPosition.contains(this.position - i ))
            if (!enemyArmyPosition.contains(this.position -  i ))
              possibleMoves.add(this.position -  i );
            else {

              possibleAttacks.add(this.position -  i );
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
          if (!friendArmyPosition.contains(this.position - (8 * i) ))
            if (!enemyArmyPosition.contains(this.position - (8 * i) ))
              possibleMoves.add(this.position - (8 * i) );
            else {

              possibleAttacks.add(this.position - (8 * i)  );
              break;
            }
          else{
            print("break white loop");
            break;
          }

        }
        for (int i = 1; i <= 1 ; i++) {
          print("king down diagonal right ${this.position - (8 * i) + i}");
          if (!friendArmyPosition.contains(this.position - (8 * i) + i))
            if (!enemyArmyPosition.contains(this.position - (8 * i) + i))
              possibleMoves.add(this.position - (8 * i) + i,);
            else {

              possibleAttacks.add(this.position - (8 * i) +i );
              break;
            }
          else{
            print("break white loop");
            break;
          }

        }
        for (int i = 1; i <= 1 ; i++) {
          print("king down diagonal left ${this.position - (8 * i) - i}");
          if (!friendArmyPosition.contains(this.position - (8 * i) - i))
            if (!enemyArmyPosition.contains(this.position - (8 * i) - i))
              possibleMoves.add(this.position - (8 * i) - i,);
            else {

              possibleAttacks.add(this.position - (8 * i) -i );
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

          if (!friendArmyPosition.contains(this.position + (8 * i) ))
            if (!enemyArmyPosition.contains(this.position + (8 * i) ))
              possibleMoves.add(this.position + (8 * i) );
            else {

              possibleAttacks.add(this.position + (8 * i) );
              break;
            }
          else
            break;
        }
        for (int i = 1; i <= 1 ; i++) {
          print("king down diagonal right ${this.position + (8 * i) + i}");

          if (!friendArmyPosition.contains(this.position + (8 * i) + i))
            if (!enemyArmyPosition.contains(this.position + (8 * i) + i))
              possibleMoves.add(this.position + (8 * i) + i,);
            else {

              possibleAttacks.add(this.position + (8 * i)+i );
              break;
            }
          else
            break;
        }
        for (int i = 1; i <= 1 ; i++) {
          print("king down diagonal left ${this.position + (8 * i) - i}");
          if (!friendArmyPosition.contains(this.position + (8 * i) - i))
            if (!enemyArmyPosition.contains(this.position + (8 * i) - i))
              possibleMoves.add(this.position + (8 * i) - i,);
            else {

              possibleAttacks.add(this.position + (8 * i) -i);
              break;
            }
          else
            break;
        }
      }

    
    this.possiblePaths=possibleMoves;
    this.possibleAttacks=possibleAttacks;
  }

}