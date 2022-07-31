import 'package:flutter/material.dart';
import 'package:frentic/play_games.dart';

import 'Home.dart';
import 'newslist.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Widget home = Home1();
  Color? cir = Colors.green[800]; //Changing of home earn icon
  Color cir2 = Color.fromRGBO(168, 168, 168, 1);
  Color play = Color.fromRGBO(168, 168, 168, 1);
  Color pro = Color.fromRGBO(168, 168, 168, 1);
  AnimationController? controller;
  Animation? animation;
  String name = "hello";
  double height = 0;
  int n = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 200),
        vsync: this,
        upperBound: -290,
        lowerBound: -900);
    controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        //controller.forward();
      }
      print(status);
    });
    controller!.addListener(() {
      name = controller!.value.toInt().toString();
      height = -(controller!.value);
      print(height);
      setState(() {});
    });
    setState(() {
      // setState can change reload the app
    });
    animate();
  }

  void animate() {
    animation = CurvedAnimation(parent: controller!, curve: Curves.decelerate);
    controller!.forward();
    //print(animation);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          //Text("hello"),
          home,
          Positioned(
            bottom: 0,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: SizedBox(
                    width: size.width,
                    child: Container(
                        height: 50,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(48.0),
                            boxShadow: [
                              new BoxShadow(color: Colors.black, blurRadius: 2)
                            ]),
                        child: Container(
                          color: Colors.white,
                        )),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width / 26,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                            backgroundColor: cir2,
                            child: IconButton(
                              iconSize: 25,
                              icon: Image.asset(
                                "assets/logo/PinClipart.com_newspaper-article-clipart_4545041.png",
                                color: Colors.white,
                              ),
                              onPressed: () {
                                home = News_list();
                                cir = Color.fromRGBO(168, 168, 168,
                                    1); //Color.fromRGBO(168, 168, 168, 1);
                                cir2 = Colors.green[800]!;
                                play = Color.fromRGBO(168, 168, 168, 1);
                                setState(() {});
                              },
                            )),
                        Text(
                          "News",
                          style: TextStyle(color: cir2, fontSize: 13),
                        )
                      ],
                    ),
                    SizedBox(
                      width: size.width / 9,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                            backgroundColor: cir,
                            child: IconButton(
                              iconSize: 27,
                              icon: Image.asset(
                                'assets/logo/rupees-icon-22.jpg',
                                color: Colors.white,
                                width: 40,
                              ),
                              onPressed: () {
                                setState(() {
                                  cir = Colors.green[800];
                                  home = Home1();
                                  cir2 = Color.fromRGBO(168, 168, 168, 1);
                                  play = Color.fromRGBO(168, 168, 168, 1);
                                });
                              },
                            )),
                        Text(
                          "Earn money",
                          style: TextStyle(
                            color: cir,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: size.width / 9,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                            backgroundColor: play,
                            child: IconButton(
                              iconSize: 70,
                              icon: Image.asset(
                                "assets/logo/game.png",
                                color: Colors.white,
                              ),
                              onPressed: () {
                                home = PlayGames();
                                play = Colors.green[800]!;
                                cir = Color.fromRGBO(168, 168, 168, 1);
                                cir2 = Color.fromRGBO(168, 168, 168, 1);
                                setState(() {});
                              },
                            )),
                        Text(
                          "Play Game",
                          style: TextStyle(color: play, fontSize: 13),
                        )
                      ],
                    ),
                    SizedBox(
                      width: size.width / 9,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                            backgroundColor: Color.fromRGBO(168, 168, 168, 1),
                            child: IconButton(
                              iconSize: 25,
                              icon: Icon(Icons.person_rounded),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Profile()));
                              },
                            )),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: Color.fromRGBO(168, 168, 168, 1),
                              fontSize: 13),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: 40, top: height + 10, right: 34, bottom: 0),
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Image(
                    width: double.infinity,
                    height: 190,
                    fit: BoxFit.fill,
                    image: AssetImage('assets/offer.png')),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width / 1.18, top: height, right: 17, bottom: 8),
                child: GestureDetector(
                    onTap: () {
                      controller!.reverse();
                      setState(() {});
                    },
                    child: Image(
                        width: 34, image: AssetImage('assets/remove.png'))),
              ),
            ],
          )
        ],
      )),
    );
  }
}
