import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frentic/api/AppUrlConstant.dart';
import 'package:frentic/api/apiManager.dart';
import 'package:frentic/api/apiresponse/campaign_response.dart';
import 'package:frentic/api/sharedprefrence.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class GameApply extends StatefulWidget {
  final String Id;
  final String title;
  final String url;

  GameApply(this.Id, this.title, this.url);

  @override
  _GameApplyState createState() => _GameApplyState();
}

class _GameApplyState extends State<GameApply> {
  var rs;
  var responseNew;
  var dio = Dio();
  int TotalReward = 0;

  void initState() {
    getData();
    create_url();

    super.initState();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double size2 = MediaQuery.of(context).size.width.toDouble();
    final double size1 = MediaQuery.of(context).size.height.toDouble();

    return FutureBuilder<List<CampaignResponse>>(
      future: Provider.of<ApiManager>(context, listen: false)
          .fetchCampaigns(widget.Id), // function where you call your api
      builder: (BuildContext context,
          AsyncSnapshot<List<CampaignResponse>> snapshot) {
        // AsyncSnapshot<Your object type>
        if (snapshot.hasData) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                  ),
                ),
                title: Text(
                  "Ludo King",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              body: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              new BoxShadow(
                                  color: Colors.black12, blurRadius: 10)
                            ]),
                            child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                margin: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Stack(children: [
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              size2 / 200,
                                              size1 / 9,
                                              size2 / 200,
                                              0),
                                          child: Container(
                                            width: size.width / 1.07,
                                            height: size.height / 20,
                                            color: Color.fromRGBO(
                                                179, 230, 255, 1),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              20, size1 / 17, 0, 0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star_border,
                                                color: Colors.yellow[800],
                                                size: 20,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.all(2)),
                                              Text(
                                                "4.5",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          )),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 0, 0),
                                        child: Text(
                                          widget.title,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            size2 / 4, size1 / 8, 0, 0),
                                        child: Text(
                                          "Total Reward = 0",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              size1 / 60,
                                              size2 / 14,
                                              0,
                                              size2 / 18),
                                          child: Container(
                                            decoration: new BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(48.0),
                                                boxShadow: [
                                                  new BoxShadow(
                                                      color: Colors.black,
                                                      blurRadius: 8)
                                                ]),
                                          )),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            size2 / 1.8, size1 / 26, 0, 00),
                                        child: Container(
                                          width: size.width / 3.2,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Color.fromRGBO(
                                                      77, 195, 255, 1),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50))),
                                              onPressed: () {
                                                _launchUrl(widget.url);
                                              },
                                              child: Text("Install")),
                                        ),
                                      ),
                                    ])
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: Image.asset("assets/emptyBox.png")),
                                Text(
                                  "List Is Empty",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 30),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: new CircularProgressIndicator()),
          );
        }
        // else {
        //   return SafeArea(
        //     child: Scaffold(
        //       appBar: AppBar(
        //         backgroundColor: Colors.white,
        //         leading: IconButton(
        //           onPressed: () {
        //             Navigator.pop(context);
        //           },
        //           icon: Icon(
        //             Icons.arrow_back_ios_rounded,
        //             color: Colors.black,
        //           ),
        //         ),
        //         title: Text(
        //           "Ludo King",
        //           style: TextStyle(
        //               color: Colors.black,
        //               fontSize: 18,
        //               fontWeight: FontWeight.bold),
        //         ),
        //       ),
        //       body: Stack(
        //         children: [
        //           SingleChildScrollView(
        //             child: Padding(
        //               padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        //               child: Column(
        //                 children: [
        //                   Container(
        //                     decoration: BoxDecoration(boxShadow: [
        //                       new BoxShadow(
        //                           color: Colors.black12, blurRadius: 10)
        //                     ]),
        //                     child: Card(
        //                         color: Colors.white,
        //                         shape: RoundedRectangleBorder(
        //                           borderRadius: BorderRadius.circular(0),
        //                         ),
        //                         margin: EdgeInsets.all(8.0),
        //                         child: Row(
        //                           children: [
        //                             Stack(children: [
        //                               Padding(
        //                                   padding: EdgeInsets.fromLTRB(
        //                                       size2 / 200,
        //                                       size1 / 9,
        //                                       size2 / 200,
        //                                       0),
        //                                   child: Container(
        //                                     width: size.width / 1.07,
        //                                     height: size.height / 20,
        //                                     color: Color.fromRGBO(
        //                                         179, 230, 255, 1),
        //                                   )),
        //                               Padding(
        //                                   padding: EdgeInsets.fromLTRB(
        //                                       20, size1 / 17, 0, 0),
        //                                   child: Row(
        //                                     children: [
        //                                       Icon(
        //                                         Icons.star_border,
        //                                         color: Colors.yellow[800],
        //                                         size: 20,
        //                                       ),
        //                                       Padding(
        //                                           padding: EdgeInsets.all(2)),
        //                                       Text(
        //                                         "4.5",
        //                                         textAlign: TextAlign.center,
        //                                         style: TextStyle(
        //                                             fontWeight:
        //                                                 FontWeight.bold),
        //                                       ),
        //                                     ],
        //                                   )),
        //                               Padding(
        //                                 padding:
        //                                     EdgeInsets.fromLTRB(20, 10, 0, 0),
        //                                 child: Text(
        //                                   widget.title,
        //                                   style: TextStyle(
        //                                       fontSize: 18,
        //                                       color: Colors.green,
        //                                       fontWeight: FontWeight.bold),
        //                                 ),
        //                               ),
        //                               Padding(
        //                                 padding: EdgeInsets.fromLTRB(
        //                                     size2 / 4, size1 / 8, 0, 0),
        //                                 child: Text(
        //                                   "Total Reward = " +
        //                                       responseNew.data['goals'][0]
        //                                           ['payouts'][0]['currency'] +
        //                                       " " +
        //                                       TotalReward.toString(),
        //                                   style: TextStyle(
        //                                       fontSize: 18,
        //                                       color: Colors.green,
        //                                       fontWeight: FontWeight.bold),
        //                                 ),
        //                               ),
        //                               Padding(
        //                                   padding: EdgeInsets.fromLTRB(
        //                                       size1 / 60,
        //                                       size2 / 14,
        //                                       0,
        //                                       size2 / 18),
        //                                   child: Container(
        //                                     decoration: new BoxDecoration(
        //                                         borderRadius:
        //                                             BorderRadius.circular(
        //                                                 48.0),
        //                                         boxShadow: [
        //                                           new BoxShadow(
        //                                               color: Colors.black,
        //                                               blurRadius: 8)
        //                                         ]),
        //                                   )),
        //                               Padding(
        //                                 padding: EdgeInsets.fromLTRB(
        //                                     size2 / 1.8, size1 / 26, 0, 00),
        //                                 child: Container(
        //                                   width: size.width / 3.2,
        //                                   child: ElevatedButton(
        //                                       style: ElevatedButton.styleFrom(
        //                                           primary: Color.fromRGBO(
        //                                               77, 195, 255, 1),
        //                                           shape:
        //                                               RoundedRectangleBorder(
        //                                                   borderRadius:
        //                                                       BorderRadius
        //                                                           .circular(
        //                                                               50))),
        //                                       onPressed: () {
        //                                         _launchUrl(widget.url);
        //                                       },
        //                                       child: Text("Install")),
        //                                 ),
        //                               ),
        //                             ])
        //                           ],
        //                         )),
        //                   ),
        //                   ListView.builder(
        //                     physics: NeverScrollableScrollPhysics(),
        //                     shrinkWrap: true,
        //                     itemCount: responseNew.data['goals'].length,
        //                     itemBuilder: (BuildContext context, int index) {
        //                       final List<String> imageUrl = [];
        //
        //                       return InkWell(
        //                         onTap: () {},
        //                         child: ExpandablePanel(
        //                             theme:
        //                                 ExpandableThemeData(hasIcon: false),
        //                             header: Container(
        //                               height: 50,
        //                               margin:
        //                                   EdgeInsets.fromLTRB(15, 15, 15, 00),
        //                               child: Center(
        //                                 child: Text(
        //                                   responseNew.data['goals'][index]
        //                                           ['title']
        //                                       .toString()
        //                                       .toUpperCase(),
        //                                   textAlign: TextAlign.center,
        //                                   style: TextStyle(
        //                                     fontSize: 22,
        //                                     color: Colors.white,
        //                                     fontWeight: FontWeight.bold,
        //                                   ),
        //                                 ),
        //                               ),
        //                               decoration: BoxDecoration(
        //                                 color:
        //                                     Color.fromRGBO(77, 195, 255, 1),
        //                               ),
        //                             ),
        //                             collapsed: Column(),
        //                             expanded: Container(
        //                               padding: EdgeInsets.all(5),
        //                               margin:
        //                                   EdgeInsets.fromLTRB(15, 00, 15, 15),
        //                               decoration: BoxDecoration(
        //                                 border: Border.all(),
        //                               ),
        //                               child: Column(
        //                                 crossAxisAlignment:
        //                                     CrossAxisAlignment.center,
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.start,
        //                                 children: [
        //                                   Container(
        //                                     child: Text(
        //                                       'DESCRIPTION' + "",
        //                                       style: TextStyle(
        //                                           fontSize: 20,
        //                                           color: Colors.blueGrey),
        //                                     ),
        //                                   ),
        //                                   Padding(
        //                                       padding: EdgeInsets.fromLTRB(
        //                                           00, 10, 00, 10)),
        //                                   Text(
        //                                     "Malaria is a life-threatening disease caused by parasites that are transmitted to people through the bites of infected female Anopheles mosquitoes. It is preventable and curable. In 2020, there were an estimated 241 million cases of malaria worldwide. ",
        //                                   ),
        //                                   Padding(
        //                                       padding: EdgeInsets.fromLTRB(
        //                                           00, 10, 00, 10)),
        //                                   ElevatedButton(
        //                                       style: ElevatedButton.styleFrom(
        //                                           primary: Color.fromRGBO(
        //                                               77, 195, 255, 1),
        //                                           shape:
        //                                               RoundedRectangleBorder(
        //                                                   borderRadius:
        //                                                       BorderRadius
        //                                                           .circular(
        //                                                               50))),
        //                                       onPressed: () {
        //                                         _launchUrl(widget.url);
        //                                       },
        //                                       child: Text("Reward -> " +
        //                                           responseNew.data['goals']
        //                                                   [index]['payouts']
        //                                                   [0]['payout']
        //                                               .toString())),
        //                                 ],
        //                               ),
        //                             )),
        //                       );
        //                     },
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   );
        // }
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
    rs = await dio.get('https://api.trackier.com/v2/campaigns/' +
        widget.Id +
        '/goals?apiKey=61eea1a4445e29fb98cefbc3b5461eea1a444613');

    responseNew = rs;

    for (int i = 0; i < responseNew.data['goals'].length; i++) {
      TotalReward = TotalReward +
          int.parse(responseNew.data['goals'][i]['payouts'][0]['payout']);
    }

    if (responseNew.data['goals'].length > 0) {
      return Future.value("Data download successfully");
    } else {
      print("fail");
      return Future.value(
          responseNew.data['goals']['dsdf']); // return your response
    }
  }

  getData() async {}

  create_url() async {
    final String publisherId =
        await SharedPrefManager.getPrefrenceString('publisherId');

    print("publisher ID ---------->:>>>>>>>>>>> " + publisherId);

    print(AppUrlConstant.baseUrl3rd + widget.Id + "&pub_id=" + publisherId);
  }
}
