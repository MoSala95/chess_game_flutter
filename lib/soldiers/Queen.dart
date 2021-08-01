import 'I_slodier.dart';

class Queen extends ISoldier{
  Queen({required int position,required String color,required int id}){
    this.imagePath="${Queen}_$color";
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