import '../Army.dart';

abstract class ISoldier{
  late String imagePath;
  late int position;
  late int id;
  late List<int> possiblePaths=[];
  late List<int> possibleAttacks=[];

  void move();
  void attack();
  void checkPath({required String color,required Army friend, required Army enemy});
}