
import 'package:chess_game_flutter/Army.dart';

import 'I_slodier.dart';

class Bishop extends ISoldier{
  Bishop({required int position,required String color,required int id}){
    this.imagePath="assets/${Bishop}_$color.png";
    this.position=position;
    this.id=id;
  }
  @override
  void attack() {
    // TODO: implement attack
  }

  @override
  void move() {

  }
  @override
  List<int> checkPath({required String color,required Army whiteArmy, required Army blackArmy}){
   List<int>possibleMoves=[];
   int upRows=0;
   int downRows=0;
   int currentRow=(this.position/8).floor();
   upRows=7-currentRow;
   downRows=currentRow;
   List<int> whiteArmyPosition=[];
   List<int> blackArmyPosition=[];

   whiteArmy.allSoldiers.forEach((element) {whiteArmyPosition.add(element.position); });
   blackArmy.allSoldiers.forEach((element) {blackArmyPosition.add(element.position); });

   print("current position $position current row $currentRow up row count $upRows ,, down rows $downRows");
   if(color=="w") {
     if (downRows > 0) {
       for (int i = 1; i <= downRows ; i++) {
         print("bishop down rows loop ${this.position - (8 * i) + i}");
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
       for (int i = 1; i <= downRows ; i++) {
         print("bishop down rows loop ${this.position - (8 * i) - i}");
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
       for (int i = 1; i <= upRows ; i++) {
         print("bishop up rows loop ${this.position + (8 * i) + i}");

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
       for (int i = 1; i <= upRows ; i++) {
         print("bishop up rows loop ${this.position + (8 * i) - i}");
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
     if (downRows > 0) {
       for (int i = 1; i <= downRows ; i++) {
         print("bishop down rows loop ${this.position - (8 * i) + i}");
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
       for (int i = 1; i <= downRows ; i++) {
         print("bishop down rows loop ${this.position - (8 * i) - i}");
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
       for (int i = 1; i <= upRows ; i++) {
         print("bishop up rows loop ${this.position + (8 * i) + i}");
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
       for (int i = 1; i <= upRows ; i++) {
         print("bishop up rows loop ${this.position + (8 * i) - i}");

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
   return possibleMoves;
  }

}