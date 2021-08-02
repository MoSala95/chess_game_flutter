import '../Army.dart';

abstract class ISoldier{
  late String imagePath;
  late int position;
  late int id;
  late List<int> possiblePaths=[];
  void move();
  void attack();
  List<int>checkPath({required String color,required Army whiteArmy, required Army blackArmy});
}