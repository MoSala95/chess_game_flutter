import 'I_slodier.dart';

class Rook extends ISoldier{
  Rook({required int position,required String color,required int id}){
    this.imagePath="${Rook}_$color";
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