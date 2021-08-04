import 'package:chess_game_flutter/Army.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Army whiteArmy= Army("w");
  Army blackArmy= Army("b");
  late Army currentArmy;

  @override
  void initState() {
    // TODO: implement initState
    currentArmy = whiteArmy;

    super.initState();
  }

  switchPlayer(){
    if(currentArmy==whiteArmy) currentArmy=blackArmy;
    else currentArmy=whiteArmy;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(

        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: GridView.builder(
              itemCount: 64,
              shrinkWrap: true,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
              itemBuilder: (context,index){
                int isEven= (index/8).floor();
                print(isEven);
                if(currentArmy.currentSelection!=null)
                if(currentArmy.currentSelection!.position==index)
                  return Container(color:Colors.greenAccent,);
                else if(currentArmy.currentSelection!.possiblePaths.contains(index))
                  return Container(color: Colors.greenAccent,);
                else if(currentArmy.currentSelection!.possibleAttacks.contains(index))
                  return Container(color: Colors.redAccent,);
                  else if(isEven%2==0)
                    return Container(color:index%2==0?Colors.white: Colors.orangeAccent);
                  else
                    return Container(color:index%2==0?Colors.orangeAccent: Colors.white);
                else
                 if(isEven%2==0)
                  return Container(color:index%2==0?Colors.white: Colors.orangeAccent);
                else
                  return Container(color:index%2==0?Colors.orangeAccent: Colors.white);

              },),
          ),
          Container(
            alignment: Alignment.center,
            child: GridView.builder(
              itemCount: 64,
              shrinkWrap: true,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),

              itemBuilder: (context,index){
                for(var item in whiteArmy.allSoldiers)
                  if(item.position==index)
                    return GestureDetector(
                        onTap: () {
                          if(currentArmy==whiteArmy){
                            currentArmy=whiteArmy;
                            currentArmy.currentSelection=item;
                            currentArmy.currentSelection!.possiblePaths.clear();
                            currentArmy.currentSelection!.possibleAttacks.clear();
                            print('current selection color ${currentArmy.color}');
                            currentArmy.currentSelection!.checkPath(color: currentArmy.color, friend: whiteArmy, enemy: blackArmy);
                          }
                          else if(currentArmy.currentSelection!=null &&currentArmy.currentSelection!.possibleAttacks.contains(index)){
                            currentArmy.currentSelection!.position=index;
                            currentArmy.currentSelection!.possiblePaths.clear();
                            currentArmy.currentSelection!.possibleAttacks.clear();
                            currentArmy.currentSelection=null;
                            switchPlayer();
                            print("possible kill");
                            currentArmy.allSoldiers.removeWhere((element) {
                              print("remove element ${element.position} ,, index $index");

                              return element.position==index;
                            } );
                          }
                       setState(() {
                          });

                        },
                        child: Container(child: Image.asset(item.imagePath),
                        ));

                for(var item in blackArmy.allSoldiers)
                  if(item.position==index)
                    return GestureDetector(
                        onTap: () {
                          if(currentArmy==blackArmy){
                            currentArmy=blackArmy;
                            currentArmy.currentSelection=item;
                            currentArmy.currentSelection!.possiblePaths.clear();
                            currentArmy.currentSelection!.possibleAttacks.clear();
                            print('current selection color ${currentArmy.color}');
                            currentArmy.currentSelection!.checkPath(color: currentArmy.color, friend: blackArmy, enemy: whiteArmy);

                          } else if( currentArmy.currentSelection!=null &&currentArmy.currentSelection!.possibleAttacks.contains(index)){
                            currentArmy.currentSelection!.position=index;
                            currentArmy.currentSelection!.possiblePaths.clear();
                            currentArmy.currentSelection!.possibleAttacks.clear();
                            currentArmy.currentSelection=null;
                            switchPlayer();
                            print("possible kill");
                            currentArmy.allSoldiers.removeWhere((element) {
                              print("remove element ${element.position} ,, index $index");

                              return element.position==index;
                            } );
                          }
                        setState(() {
                          });

                        },
                        child: Container(child: Image.asset(item.imagePath),
                        ));

                return GestureDetector(
                    onTap: () {

                        if(currentArmy.currentSelection!=null){
                          if(currentArmy.currentSelection!.possiblePaths.contains(index)||currentArmy.currentSelection!.possibleAttacks.contains(index)){
                              currentArmy.currentSelection!.position=index;
                              currentArmy.currentSelection!.possiblePaths.clear();
                              currentArmy.currentSelection!.possibleAttacks.clear();
                              currentArmy.currentSelection=null;
                              print("not a kill");
                              switchPlayer();
                              setState(() {

                              });
                            }
                        }

                    },
                    child: Container(color: Colors.transparent,));
              },),
          ),
        ],
      ),
    );
  }
}
