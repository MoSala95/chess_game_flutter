abstract class ISoldier {
  late String imagePath;
  late int position;
  late int id;
  late String color;

  bool move({required int currentIndex, required int newIndex});

  bool attack({required ISoldier attackedSoldier});
}
