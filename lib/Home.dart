// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frentic/api/apiManager.dart';
import 'package:frentic/api/apiresponse/responsefetchbrans.dart';
import 'package:frentic/api/apiresponse/responseslider.dart';
import 'package:frentic/api/sharedprefrence.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'TermsandCondition.dart';
import 'aboutUs.dart';
import 'faq.dart';
import 'game_apply.dart';
import 'invite&earn.dart';
import 'profile.dart';
import 'wallet.dart';

class Home1 extends StatefulWidget {
  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final String fetchbrands = "http://cashera.frantic.in/RestApi/fetch_brands";
  Widget? home;
  ResponseFetchBrands? responseFetchBrands;
  ResponseSlider? responseSlider;
  var dio = Dio();

  var response;
  var responses;

  List<AssetImage> img = [
    AssetImage("assets/logo/amazon.JPG"),
    AssetImage("assets/logo/ajio.JPG"),
    AssetImage("assets/logo/big.JPG"),
    AssetImage("assets/logo/go.JPG"),
    AssetImage("assets/logo/gana.JPG"),
    AssetImage("assets/logo/amazon.JPG"),
    AssetImage("assets/logo/big.JPG")
  ];

  void getuserkey() async {
    final response1 = await post(Uri.parse(fetchbrands), body: {
      // "key":userkey,
    });
    print(response1.body);
    var jsonData1 = jsonDecode(response1.body);
    print(jsonData1);
  }

  @override
  void initState() {
    getData();

    var futureSlider =
        Provider.of<ApiManager>(context, listen: false).fetchSliderApi();
    futureSlider.then((value) {
      setState(() {
        responseSlider = value;
        print("errocode   " + value!.data.toString());
      });
    });

    var future =
        Provider.of<ApiManager>(context, listen: false).fetchBrandApi();
    future.then((value) {
      setState(() {
        responseFetchBrands = value;
        print("errocode   " + value!.errorCode.toString());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double size1 = MediaQuery.of(context).size.width.toDouble();
    final double size2 = MediaQuery.of(context).size.height.toDouble();
    return FutureBuilder<String>(
      future: downloadData(), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: new CircularProgressIndicator()),
          );
        } else {
          if (snapshot.hasError) {
            return Scaffold(backgroundColor: Colors.white);
          } else {
            return SafeArea(
              child: Scaffold(
                key: _scaffoldKey,
                drawer: SizedBox(
                  width: 250,
                  child: new Drawer(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()));
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(35, 18, 0, 0),
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
                                  "",
                                  style: TextStyle(
                                      color: Colors.green[900],
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutUs()));
                          },
                          child: Container(
                            height: 50,
                            color: Color.fromRGBO(247, 247, 247, 1),
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
                                              'assets/logo/manager.png'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 8, 0, 0),
                                          child: Text(
                                            "About Us",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              115, 0, 0, 0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.green[800],
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Wallet()));
                          },
                          child: Container(
                            height: 50,
                            color: Color.fromRGBO(247, 247, 247, 1),
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
                                              'assets/logo/cash.png'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 8, 0, 0),
                                          child: Text(
                                            "Wallet",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              134, 0, 0, 0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.green[800],
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Invite()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Container(
                              height: 50,
                              color: Color.fromRGBO(247, 247, 247, 1),
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
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 8, 0, 0),
                                            child: Text(
                                              "Invite & Earn",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                88, 0, 0, 0),
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.green[800],
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
                                    builder: (context) =>
                                        TermsandConditions()));
                          },
                          child: Container(
                            height: 50,
                            color: Color.fromRGBO(247, 247, 247, 1),
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
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 8, 0, 0),
                                          child: Text(
                                            "Terms & Conditions",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              38, 0, 0, 0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.green[800],
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
                              color: Color.fromRGBO(247, 247, 247, 1),
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
                                                'assets/logo/faq.png'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 8, 0, 0),
                                            child: Text(
                                              "FAQ",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                150, 0, 0, 0),
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.green[800],
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
                            color: Color.fromRGBO(247, 247, 247, 1),
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
                                              'assets/logo/review.png'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 8, 0, 0),
                                          child: Text(
                                            "Feedback",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              107, 0, 0, 0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.green[800],
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
                          onTap: () async {
                            await SharedPrefManager.clearPrefs();
                            /*SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.remove("boolValue");
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        Load()), (Route<dynamic> route) => false);*/
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 20, 0, 0),
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
                            color: Color.fromRGBO(247, 247, 247, 1),
                            child: Image(
                                width: 120,
                                image: AssetImage('assets/logo.JPG')),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                body: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 44),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Card(
                                color: Colors.black26,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                margin: EdgeInsets.fromLTRB(3, 12, 3, 0),
                                child: Container(
                                  width: size.width,
                                  height: size.height / 7,
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent[100],
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 4,
                                        offset: Offset(1, 2), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: Container(
                                              width: size.width / 1.9,
                                              child: Text(
                                                "Save big on Amazon Fashion 20% cashback|max 200",
                                                textAlign: TextAlign.left,
                                              ))),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Image(
                                          width: 100,
                                          height: 180,
                                          image: AssetImage(
                                              "assets/money-8333.png")),
                                    ],
                                  ),
                                ),
                              ),
                              if (responseSlider == null)
                                Center(child: CircularProgressIndicator())
                              else
                                SizedBox(
                                  height: size.height / 7.5,
                                  child: Container(
                                    color: Colors.black,
                                    child: ListView.builder(
                                        physics: ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: responseSlider!.data!.length,
                                        itemBuilder: (BuildContext context,
                                                int index) =>
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                width: size.width / 3.5,
                                                height: size.height / 7.5,
                                                child: Card(
                                                    color: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0),
                                                    ),
                                                    margin:
                                                        EdgeInsets.all(12.0),
                                                    child: Container(
                                                        height: 80,
                                                        width: 90,
                                                        child: Center(
                                                            child:
                                                                Image.network(
                                                          responseSlider!
                                                              .data![index]
                                                              .image!,
                                                        )))),
                                              ),
                                            )),
                                  ),
                                ),
                              if (responseFetchBrands == null)
                                Center(child: CircularProgressIndicator())
                              else
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount:
                                        response.data['campaigns'].length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      GameApply(
                                                          response
                                                              .data['campaigns']
                                                                  [index]['id']
                                                              .toString(),
                                                          response
                                                              .data['campaigns']
                                                                  [index]
                                                                  ['title']
                                                              .toString(),
                                                          response
                                                              .data['campaigns']
                                                                  [index]
                                                                  ['previewUrl']
                                                              .toString())));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Card(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              margin: EdgeInsets.all(5),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        width:
                                                            size.width / 1.08,
                                                        height: 50,
                                                        color:
                                                            Colors.green[800],
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Flexible(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            20,
                                                                            10,
                                                                            00,
                                                                            00),
                                                                child: Text(
                                                                  response.data[
                                                                          'campaigns']
                                                                          [
                                                                          index]
                                                                          [
                                                                          'title']
                                                                      .toString(),
                                                                  maxLines: 1,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        height: 60,
                                                        child: CircleAvatar(
                                                          radius: 40,
                                                          backgroundImage:
                                                              NetworkImage(
                                                            response.data[
                                                                    'campaigns']
                                                                    [index][
                                                                    'thumbnail']
                                                                .toString(),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        response
                                                            .data['campaigns']
                                                                [index]
                                                                ['payouts'][0]
                                                                ['payout']
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                      Text(
                                                        response
                                                            .data['campaigns']
                                                                [index]
                                                                ['currency']
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                      Container(
                                                        child: Column(
                                                          children: [
                                                            ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                  primary: Colors
                                                                      .yellow,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50))),
                                                              onPressed: () {
                                                                print(
                                                                    'onTapped launched');
                                                                _launchUrl(response
                                                                            .data[
                                                                        'campaigns']
                                                                    [
                                                                    index]['url']);
                                                              },
                                                              child: Text(
                                                                "Apply Now",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Text(
                                                          'T/C applied',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                        ),
                                      );
                                    }),
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
                              onPressed: () =>
                                  _scaffoldKey.currentState!.openDrawer(),
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
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Image(
                              height: 15,
                              width: 20,
                              image: AssetImage("assets/cooler.png"),
                              color: Colors.yellow[600],
                            ),
                            SizedBox(
                              width: size.width / 18,
                            ),
                            Image(
                              height: 120,
                              width: 100,
                              image: AssetImage("assets/logo.JPG"),
                            ),
                            SizedBox(
                              width: size.width / 7,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Wallet()));
                              },
                              child: Stack(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 7, 6, 0),
                                    child: Material(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      elevation: 8,
                                      shadowColor: Colors.black26,
                                      color: Colors.green[800],
                                      child: SizedBox(
                                        height: size.height / 34,
                                        width: size.width / 8,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(9, 5.4, 3, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "₹24",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Image(
                                            height: 27,
                                            image: AssetImage(
                                                "assets/whatsapp_logo.png"))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
      },
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<String> downloadData() async {
    response = await dio.get(
        'https://api.trackier.com/v2/campaigns?apiKey=6200eac1aeccb61d3d6700a8a126200eac1aed04');

    print(response.data['campaigns'][0]['id']);

    return Future.value("Data download successfully"); // return your response
  }

  getData() async {
    setState(() {
      responses = response;
    });
  }
}
