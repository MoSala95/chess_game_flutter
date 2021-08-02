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
    List<int> possibleMoves=[this.position,this.position+8,this.position-8];
    if(color =="w")
      for(int i=0; i <whiteArmy.allSoldiers.length;i++){
        if(possibleMoves.contains(whiteArmy.allSoldiers[i].position)){
          possibleMoves.remove(whiteArmy.allSoldiers[i].position);
          if(this.position>whiteArmy.allSoldiers[i].position)
            possibleMoves.removeWhere((element) => position>element);
           if(this.position<whiteArmy.allSoldiers[i].position)
            possibleMoves.removeWhere((element) => position<element);
        }

      }
    else{
      for(int i=0; i <blackArmy.allSoldiers.length;i++){
        if(possibleMoves.contains(blackArmy.allSoldiers[i].position)){
          possibleMoves.remove(blackArmy.allSoldiers[i].position);
          if(this.position>blackArmy.allSoldiers[i].position)
            possibleMoves.removeWhere((element) => position>element);
           if(this.position<blackArmy.allSoldiers[i].position)
            possibleMoves.removeWhere((element) => position<element);
        }

      }
    }
    return possibleMoves;
  }
}