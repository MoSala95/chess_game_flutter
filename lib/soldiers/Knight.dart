import 'I_slodier.dart';

class Knight extends ISoldier{
  Knight({required int position,required String color,required int id}){
    this.imagePath="${Knight}_$color";
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