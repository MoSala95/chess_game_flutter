import 'I_slodier.dart';

class Queen extends ISoldier{
  Queen({required int position,required String color,required int id}){
    this.imagePath="${Queen}_$color";
    this.position=position;
    this.id=id;
    this.color = color;
  }



  @override
  bool move({required int currentIndex, required int newIndex}) {
    // TODO: implement move
    throw UnimplementedError();
  }

  @override
  bool attack({required ISoldier attackedSoldier}) {
    // TODO: implement attack
    throw UnimplementedError();
  }
 

}