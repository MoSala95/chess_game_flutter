
import 'I_slodier.dart';

class Bishop extends ISoldier{
  Bishop({required int position,required String color,required int id}){
    this.imagePath="${Bishop}_$color";
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