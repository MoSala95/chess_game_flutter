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
                if(isEven%2==0)
                  if(currentArmy.currentSelection==null)
                    return Container(
                      color:index%2==0?Colors.white: Colors.orangeAccent,
                    );
                  else
                    return Container(
                      color:currentArmy.currentSelection!.position==index?Colors.redAccent:index%2==0?Colors.white: Colors.orangeAccent,
                    );
                else
                if(currentArmy.currentSelection==null)
                  return Container(
                    color:index%2==0?Colors.orangeAccent: Colors.white,
                  );
                else
                  return Container(
                    color:currentArmy.currentSelection!.position==index?Colors.redAccent:index%2==0?Colors.orangeAccent: Colors.white,
                  );

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
                          currentArmy.currentSelection=item;
                          setState(() {

                          });
                        },
                        child: Container(child: Image.asset("assets/"+item.imagePath+".png"),
                        ));

                for(var item in blackArmy.allSoldiers)
                  if(item.position==index)
                    return GestureDetector(
                        onTap: () {
                          currentArmy.currentSelection=item;
                          setState(() {

                          });
                        },
                        child: Container(child: Image.asset("assets/"+item.imagePath+".png"),
                        ));

                return GestureDetector(
                    onTap: () {
                      setState(() {
                        if(currentArmy.currentSelection!=null){
                          currentArmy.currentSelection!.position=index;
                        }

                      });
                    },
                    child: Container(color: Colors.transparent,));
              },),
          ),

        ],
      ),
    );
  }
}
