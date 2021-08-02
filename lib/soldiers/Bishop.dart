
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
   upRows=7-currentRow;
   downRows=currentRow;
   List<int> whiteArmyPosition=[];
   List<int> blackArmyPosition=[];

   whiteArmy.allSoldiers.forEach((element) {whiteArmyPosition.add(element.position); });
   blackArmy.allSoldiers.forEach((element) {blackArmyPosition.add(element.position); });

   print("current position $position current row $currentRow up row count $upRows ,, down rows $downRows");
   if(color=="w") {
     if (downRows > 0&&rightCells>0)
       for (int i = 1; i <= downRows ; i++) {
         if(i>rightCells)
           break;
         print("bishop down right   ${this.position - (8 * i) + i}");
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
     if (downRows > 0&&leftCells>0)
       for (int i = 1; i <= downRows ; i++) {
         if(i>leftCells)
           break;
         print("bishop down left  ${this.position - (8 * i) - i}");
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

     if  (upRows > 0&&rightCells>0)
       for (int i = 1; i <= upRows ; i++) {
         if(i>rightCells)
           break;
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
     if  (upRows > 0&&leftCells>0)
       for (int i = 1; i <= upRows ; i++) {
         if(i>leftCells)
           break;
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

   else{
     if (downRows > 0&&rightCells>0)
       for (int i = 1; i <= downRows ; i++) {
         if(i>rightCells)
           break;
         print("bishop down right   ${this.position - (8 * i) + i}");
         if (!blackArmyPosition.contains(this.position - (8 * i) + i))
           if (!whiteArmyPosition.contains(this.position - (8 * i) + i))
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
     if (downRows > 0&&leftCells>0)
       for (int i = 1; i <= downRows ; i++) {
         if(i>leftCells)
           break;
         print("bishop down left  ${this.position - (8 * i) - i}");
         if (!blackArmyPosition.contains(this.position - (8 * i) - i))
           if (!whiteArmyPosition.contains(this.position - (8 * i) - i))
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

     if  (upRows > 0&&rightCells>0)
       for (int i = 1; i <= upRows ; i++) {
         if(i>rightCells)
           break;
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
     if  (upRows > 0&&leftCells>0)
       for (int i = 1; i <= upRows ; i++) {
         if(i>leftCells)
           break;
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
   this.possiblePaths=possibleMoves;
   return possibleMoves;
  }

}