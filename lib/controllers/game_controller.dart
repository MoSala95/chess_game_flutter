import 'package:chess_game_flutter/Army.dart';
import 'package:chess_game_flutter/soldiers/I_slodier.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  Army whiteArmy = Army("w");
  Army blackArmy = Army("b");
  late Army currentArmy = whiteArmy;
  late Army lastArmy = blackArmy;

  setCurrentSelection(ISoldier newItem) {
    print("-----------setCurrentSelection");
    int newIndex = newItem.position;
    // currentArmy = newItem.color == "w" ? whiteArmy : blackArmy;
    // int? _indexFoundInWightArmy = whiteArmy.allSoldiers
    //     .indexWhere((ISoldier solider) => solider.position == newIndex);
    // int? _indexFoundInBlackArmy = blackArmy.allSoldiers
    //     .indexWhere((ISoldier solider) => solider.position == newIndex);

    // if (_indexFoundInWightArmy == -1 && _indexFoundInBlackArmy == -1) {
    // }

    if (newItem.color == lastArmy.color &&
        currentArmy.currentSelection == null) {
      Get.snackbar('Error', 'switch player');
    } else {
      if (currentArmy.currentSelection != null) {
        bool canAttack =
            currentArmy.currentSelection!.attack(attackedSoldier: newItem);
        int oldIndex = currentArmy.currentSelection!.position;

        print(
            "current: ${currentArmy.currentSelection!.color} - canAttack: $canAttack - new item color: ${newItem.color}- new item.position: ${newItem.position}");
        if (canAttack == true) {
          if (newItem.color == "w") {
            whiteArmy.allSoldiers
                .removeWhere((element) => (element.position == newIndex));
            blackArmy.allSoldiers
                .where((element) => element.position == oldIndex)
                .toList()[0]
                .position = newIndex;
          } else {
            blackArmy.allSoldiers
                .removeWhere((element) => (element.position == newIndex));
            whiteArmy.allSoldiers
                .where((element) => element.position == oldIndex)
                .toList()[0]
                .position = newIndex;
          }
          currentArmy.currentSelection = null;
          replaceCurrentArmy();

          update();
          print("remove");
        } else {
          currentArmy.currentSelection = newItem;
          update();
        }
      } else {
        currentArmy.currentSelection = newItem;
        update();
      }
    }
  }

  // _updateCurrentSelection(newItem) {
  //   print("-----_updateCurrentSelection");
  //   print(
  //       "lastArmy: ${lastArmy.color} - currentArmy: ${currentArmy.color} - newItem color: ${newItem.color}");
  //   if (lastArmy.color != currentArmy.color) {
  //     currentArmy.currentSelection = newItem;
  //     // lastArmy = currentArmy.color == "w" ? blackArmy : whiteArmy;
  //     update();
  //   } else {
  //     Get.snackbar('Error', 'switch player');
  //   }
  // }

  moveToEmptyCell(int newIndex) {
    print("----------moveToEmptyCell");

    if (currentArmy.currentSelection != null) {
      bool canMove = currentArmy.currentSelection!.move(
          currentIndex: currentArmy.currentSelection!.position,
          newIndex: newIndex);

      if (canMove == true) {
        currentArmy.currentSelection!.position = newIndex;
        currentArmy.currentSelection = null;
        replaceCurrentArmy();

        update();
      }
    }
  }

  replaceCurrentArmy() {
    print("replaceCurrentArmy");
    if (currentArmy.color == "w") {
      lastArmy = whiteArmy;
      currentArmy = blackArmy;
    } else {
      lastArmy = blackArmy;
      currentArmy = whiteArmy;
    }
    print(
        "after replacenent lastArmy: ${lastArmy.color} - currentArmy: ${currentArmy.color}");
  }

  clear() {
    whiteArmy = Army("w");
    blackArmy = Army("b");
    currentArmy = whiteArmy;
    lastArmy = blackArmy;
    update();
  }
}
