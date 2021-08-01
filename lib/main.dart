import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/game_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chess Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final controller = Get.put(GameController());

  Color getBoxColor({required int index, required bool isSelected}) {
    bool isRowEven = (index / 8).floor() % 2 == 0;
    bool isIndexEven = index % 2 == 0;
    if (isSelected == true) {
      return Colors.red;
    } else if (isRowEven == true) {
      if (isIndexEven == true) {
        return Colors.white;
      } else if (isIndexEven == false) {
        return Colors.orangeAccent;
      }
    } else {
      if (isIndexEven == true) {
        return Colors.orangeAccent;
      } else if (isIndexEven == false) {
        return Colors.white;
      }
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GameController>(builder: (gameController) {
        return Container(
            child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  itemCount: 64,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8),
                  itemBuilder: (context, index) {
                    Color _color = getBoxColor(
                        index: index,
                        isSelected:
                            gameController.currentArmy.currentSelection !=
                                    null &&
                                gameController.currentArmy.currentSelection!
                                        .position ==
                                    index);
                    for (var item in gameController.whiteArmy.allSoldiers)
                      if (item.position == index)
                        return _buildCell(
                            onPressed: () {
                              gameController.setCurrentSelection(item);
                            },
                            item: item,
                            index: index,
                            color: _color);

                    for (var item in gameController.blackArmy.allSoldiers)
                      if (item.position == index)
                        return _buildCell(
                            onPressed: () {
                              gameController.setCurrentSelection(item);
                            },
                            item: item,
                            index: index,
                            color: _color);

                    return _buildCell(
                        onPressed: () {
                          gameController.moveToEmptyCell(index);
                          // setState(() {
                          //   if (gameController.currentArmy.currentSelection !=
                          //       null) {
                          //     gameController
                          //         .currentArmy.currentSelection!.position = index;
                          //   }
                          // });
                        },
                        item: null,
                        index: index,
                        color: _color);
                  }),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Text("player: ${gameController.currentArmy.color}")),
            InkWell(
              onTap: () => gameController.clear(),
              child: Container(
                  color: Colors.amber,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  child: Text("Clear")),
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ));
      }),
    );
  }

  _buildCell(
      {required var item,
      required Function() onPressed,
      required int index,
      required Color color}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          color: color,
          child: Column(
            children: [
              Text("$index"),
              item != null && item.position == index
                  ? Image.asset(
                      "assets/" + item.imagePath + ".png",
                      height: 33.0,
                    )
                  : Container(
                      color: Colors.transparent,
                    ),
            ],
          )),
    );
  }
}
