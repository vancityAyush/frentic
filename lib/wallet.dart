import 'package:flutter/material.dart';
import 'package:frentic/api/apiManager.dart';
import 'package:frentic/api/apiresponse/responsewallet.dart';
import 'package:provider/provider.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  late ResponseWallet responseWallet;

  @override
  void initState() {
    var future =
        Provider.of<ApiManager>(context, listen: false).fetchWalletApi();

    future.then((value) {
      setState(() {
        responseWallet = value!;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        // height: size.height / 40,
                        ),
                    Container(
                      alignment: Alignment.centerLeft,
                      // width: size.width / 0.5,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: TextButton.icon(
                              icon: Hero(
                                  tag: 1, child: Icon(Icons.arrow_back_ios)),
                              label: Text(
                                "Wallet",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Wallet Amount",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "₹ 4,654",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Image(
                            width: 140,
                            height: 40,
                            image: AssetImage('assets/logo.JPG'))
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width / 15),
                      child: SizedBox(
                          child: Text(
                        "-----------------------------------------------",
                        style: TextStyle(fontSize: 24, color: Colors.black26),
                      )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "4 Oct 2020",
                          style: TextStyle(color: Colors.black26),
                        ),
                        SizedBox(
                          width: size.width / 2.7,
                        ),
                        Row(
                          children: [
                            Icon(Icons.widgets_outlined),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text("Filter"),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (responseWallet == null)
                      CircularProgressIndicator()
                    else
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: responseWallet.data!.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: responseWallet
                                                          .data![index]
                                                          .transType ==
                                                      "CREDIT"
                                                  ? Colors.green[800]
                                                  : Colors.red,
                                              radius: 25,
                                              child: Text('₹'),
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(responseWallet
                                                          .data![index]
                                                          .remarks!),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8, left: 12),
                                                  child: Text(
                                                    '12:07',
                                                    style: TextStyle(
                                                        color: Colors.black26),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 6),
                                          child: SizedBox(
                                            width: size.width / 1.1,
                                            child: Container(
                                              height: 1,
                                              color: Colors.black26,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6, right: 13),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          responseWallet
                                                      .data![index].transType ==
                                                  "CREDIT"
                                              ? Icons.add_sharp
                                              : Icons.minimize,
                                          color: responseWallet
                                                      .data![index].transType ==
                                                  "CREDIT"
                                              ? Colors.green[800]
                                              : Colors.red,
                                          size: 16,
                                        ),
                                        Text(
                                          responseWallet.data![index].amount!,
                                          style: TextStyle(
                                              color: responseWallet.data![index]
                                                          .transType ==
                                                      "CREDIT"
                                                  ? Colors.green[800]
                                                  : Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            );
                          })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
