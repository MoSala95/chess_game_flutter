import '../Army.dart';
import 'I_slodier.dart';

class Knight extends ISoldier {
  Knight({required int position, required String color, required int id}) {
    this.imagePath = "assets/${Knight}_$color.png";
    this.position = position;
    this.id = id;
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
  List<int> checkPath(
      {required String color, required Army whiteArmy, required Army blackArmy}) {
    // TODO: implement checkPath
    throw UnimplementedError();
  }
}