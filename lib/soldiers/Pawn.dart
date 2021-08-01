import 'I_slodier.dart';

class Pawn extends ISoldier{
  Pawn({required int position,required String color,required int id}){
    this.imagePath="${Pawn}_$color";
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

}