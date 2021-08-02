import 'package:chess_game_flutter/Army.dart';
import 'package:chess_game_flutter/soldiers/I_slodier.dart';
import 'package:chess_game_flutter/soldiers/King.dart';
import 'package:chess_game_flutter/soldiers/Knight.dart';
import 'package:chess_game_flutter/soldiers/Pawn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  Army whiteArmy = Army("w");
  Army blackArmy = Army("b");
  late Army currentArmy = whiteArmy;
  late Army lastArmy = blackArmy;
  List<int> availablePathes = [];

  setCurrentSelection(ISoldier newItem) {
    print("-----------setCurrentSelection");
    int newIndex = newItem.position;
    // currentArmy = newItem.color == "w" ? whiteArmy : blackArmy;

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

  moveToEmptyCell(int newIndex) {
    print("----------moveToEmptyCell move to => $newIndex");

    if (currentArmy.currentSelection != null) {
      if (currentArmy.currentSelection is King ||
          currentArmy.currentSelection is Knight ||
          currentArmy.currentSelection is Pawn) {
        availablePathes = currentArmy.currentSelection!
            .checkPath(whiteArmy: whiteArmy, blackArmy: blackArmy);
        update();
        Future.delayed(Duration(milliseconds: 100), () {
          if (availablePathes
                  .where((element) => element == newIndex)
                  .toList()
                  .length >
              0) {
            currentArmy.currentSelection!.position = newIndex;
            currentArmy.currentSelection = null;
            availablePathes = [];
            replaceCurrentArmy();

            update();
          }
        });
      } else {
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
    availablePathes = [];
    update();
  }

  Color getBoxColor({required int index, required bool isSelected}) {
    bool isRowEven = (index / 8).floor() % 2 == 0;
    bool isIndexEven = index % 2 == 0;
    if (isSelected == true) {
      return Colors.amber;
    } else if (availablePathes.length > 0 &&
        availablePathes.where((path) => path == index).toList().length > 0) {
      return Colors.lightBlue;
    } else if (isRowEven == true) {
      if (isIndexEven == true) {
        return Colors.white;
      } else if (isIndexEven == false) {
        return Colors.brown.shade100;
      }
    } else {
      if (isIndexEven == true) {
        return Colors.brown.shade100;
      } else if (isIndexEven == false) {
        return Colors.white;
      }
    }
    return Colors.transparent;
  }
}
