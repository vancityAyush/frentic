// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'TermsandCondition.dart';
import 'aboutUs.dart';
import 'faq.dart';
import 'invite&earn.dart';
import 'wallet.dart';

class PlayGames extends StatefulWidget {
  @override
  _PlayGamesState createState() => _PlayGamesState();
}

class _PlayGamesState extends State<PlayGames> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final size1 = MediaQuery.of(context).size.height.toDouble();
    List<String> lst = [
      'Quiz',
      'Cricket',
      'Bubble',
      'Race',
      'Fantesy',
      'Slap Fast',
      'Quiz'
    ];
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: SizedBox(
          width: 250,
          child: new Drawer(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 18, 0, 0),
                      child: CircleAvatar(
                          minRadius: 35,
                          maxRadius: 35,
                          backgroundImage: AssetImage(
                            'assets/logo/standing_man.JPG',
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 30, 0, 0),
                      child: Text(
                        "MC",
                        style: TextStyle(
                            color: Colors.green[900],
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 16, 0, 0),
                      child: Text("My Account",
                          style: TextStyle(
                              color: Colors.green[700],
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                SizedBox(
                  height: 19,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutUs()));
                  },
                  child: Container(
                    height: 50,
                    color: Color.fromRGBO(232, 232, 232, 1),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 250,
                          height: 45,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image(
                                  width: 24,
                                  height: 30,
                                  image: AssetImage('assets/logo/manager.png'),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 0, 0),
                                  child: Text(
                                    "About Us",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(115, 0, 0, 0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Container(
                      height: 50,
                      color: Color.fromRGBO(232, 232, 232, 1),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 250,
                            height: 45,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image(
                                    width: 24,
                                    height: 30,
                                    image: AssetImage('assets/logo/salary.png'),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 0, 0),
                                    child: Text(
                                      "Earn Money",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(94, 0, 0, 0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Wallet()));
                  },
                  child: Container(
                    height: 50,
                    color: Color.fromRGBO(232, 232, 232, 1),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 250,
                          height: 45,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image(
                                  width: 24,
                                  height: 30,
                                  image: AssetImage('assets/logo/cash.png'),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 0, 0),
                                  child: Text(
                                    "Wallet",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(134, 0, 0, 0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Invite()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Container(
                      height: 50,
                      color: Color.fromRGBO(232, 232, 232, 1),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 250,
                            height: 45,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image(
                                    width: 24,
                                    height: 30,
                                    image: AssetImage(
                                        'assets/logo/invitation.png'),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 0, 0),
                                    child: Text(
                                      "Invite & Earn",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(88, 0, 0, 0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TermsandConditions()));
                  },
                  child: Container(
                    height: 50,
                    color: Color.fromRGBO(232, 232, 232, 1),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 250,
                          height: 45,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image(
                                  width: 24,
                                  height: 30,
                                  image: AssetImage(
                                      'assets/logo/terms-and-conditions.png'),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 0, 0),
                                  child: Text(
                                    "Terms & Conditions",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(38, 0, 0, 0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Faq()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Container(
                      height: 50,
                      color: Color.fromRGBO(232, 232, 232, 1),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 250,
                            height: 45,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image(
                                    width: 24,
                                    height: 30,
                                    image: AssetImage('assets/logo/faq.png'),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 0, 0),
                                    child: Text(
                                      "FAQ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(150, 0, 0, 0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>News_list()));
                  },
                  child: Container(
                    height: 50,
                    color: Color.fromRGBO(232, 232, 232, 1),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 250,
                          height: 45,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image(
                                  width: 24,
                                  height: 30,
                                  image: AssetImage('assets/logo/review.png'),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 0, 0),
                                  child: Text(
                                    "Feedback",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(107, 0, 0, 0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>News_list()));
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 20, 0, 0),
                        child: Text("Logout",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, size.width / 9, 0, 0),
                  child: Container(
                    width: size.width / 1,
                    height: size.height / 30,
                    color: Colors.black12,
                    child:
                        Image(width: 120, image: AssetImage('assets/logo.JPG')),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 29, 0, 0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, size1 / 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Card(
                          color: Colors.black26,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          margin: EdgeInsets.all(0.0),
                          child: Container(
                            width: size.width,
                            height: size.height / 6,
                            color: Colors.black,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(3, size1 / 19, 0, 0),
                              child: ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 6,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            6, 0, 0, 0),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.black,
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 0)),
                                          onPressed: () {},
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: AssetImage(
                                                  'assets/1.JPG',
                                                ),
                                                minRadius: 30,
                                                maxRadius: 30,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 10, 0, 0),
                                                child: Text(
                                                  lst[index],
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              "Top Picks Games",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: FlatButton(
                                      onPressed: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => GameApply()));
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image(
                                                width: 110,
                                                height: 70,
                                                image:
                                                    AssetImage('assets/4.JPG'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 3, 0, 0),
                                            child: Text(
                                              "Bubble shooter",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image(
                                                width: 110,
                                                height: 70,
                                                image:
                                                    AssetImage('assets/4.JPG'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 3, 0, 0),
                                            child: Text(
                                              "Cuby Zap",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image(
                                                width: 110,
                                                height: 70,
                                                image:
                                                    AssetImage('assets/4.JPG'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 3, 0, 0),
                                            child: Text(
                                              "Bubble shoot",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image(
                                                width: 110,
                                                height: 70,
                                                image:
                                                    AssetImage('assets/4.JPG'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 3, 0, 0),
                                            child: Text(
                                              "Slap Fast",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: FlatButton(
                                      onPressed: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => GameApply()));
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image(
                                                width: 110,
                                                height: 70,
                                                image:
                                                    AssetImage('assets/4.JPG'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 3, 0, 0),
                                            child: Text(
                                              "Bubble shooter",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image(
                                                width: 110,
                                                height: 70,
                                                image:
                                                    AssetImage('assets/4.JPG'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 3, 0, 0),
                                            child: Text(
                                              "Cuby Zap",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image(
                                                width: 110,
                                                height: 70,
                                                image:
                                                    AssetImage('assets/4.JPG'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 3, 0, 0),
                                            child: Text(
                                              "Bubble shoot",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image(
                                                width: 110,
                                                height: 70,
                                                image:
                                                    AssetImage('assets/4.JPG'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 3, 0, 0),
                                            child: Text(
                                              "Slap Fast",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 16, 10, 2),
                        child: SizedBox(
                            width: 400,
                            child: Image(
                                width: 100, image: AssetImage('assets/2.JPG'))),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              "Top Picks Games",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: FlatButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => GameApply()));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image(
                                            width: 110,
                                            height: 70,
                                            image: AssetImage('assets/4.JPG'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 3, 0, 0),
                                        child: Text(
                                          "Bubble shooter",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: FlatButton(
                                  onPressed: () {},
                                  child: Column(
                                    children: [
                                      Container(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image(
                                            width: 110,
                                            height: 70,
                                            image: AssetImage('assets/4.JPG'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 3, 0, 0),
                                        child: Text(
                                          "Cuby Zap",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 7,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: FlatButton(
                                  onPressed: () {},
                                  child: Column(
                                    children: [
                                      Container(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image(
                                            width: 110,
                                            height: 70,
                                            image: AssetImage('assets/4.JPG'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 3, 0, 0),
                                        child: Text(
                                          "Bubble shoot",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 7,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: FlatButton(
                                  onPressed: () {},
                                  child: Column(
                                    children: [
                                      Container(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image(
                                            width: 110,
                                            height: 70,
                                            image: AssetImage('assets/4.JPG'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 3, 0, 0),
                                        child: Text(
                                          "Slap Fast",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 7,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                height: size.height / 17,
                width: size.width / 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 4,
                      offset: Offset(1, 3), // Shadow position
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    new IconButton(
                      icon: Image.asset(
                        'assets/menu (1).png',
                        color: Colors.black,
                        width: 40,
                        height: 40,
                      ),
                      onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 7, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "₹24",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Income/₹",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Image(
                      height: 10,
                      width: 10,
                      image: AssetImage("assets/cooler.png"),
                    ),
                    SizedBox(
                      width: size.width / 10,
                    ),
                    Image(
                      height: 120,
                      width: 100,
                      image: AssetImage("assets/logo.JPG"),
                    ),
                    SizedBox(
                      width: size.width / 8,
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 11, 14, 0),
                          child: Material(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            elevation: 8,
                            shadowColor: Colors.green,
                            color: Colors.green[800],
                            child: SizedBox(
                              height: size.height / 32,
                              width: size.width / 8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(9, 10, 3, 0),
                          child: Row(
                            children: [
                              Text(
                                "₹24",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              Image(
                                  height: 27,
                                  image: AssetImage("assets/whatsapp_logo.png"))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
