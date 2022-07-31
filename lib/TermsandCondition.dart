// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class TermsandConditions extends StatefulWidget {
  @override
  _TermsandConditionsState createState() => _TermsandConditionsState();
}

class _TermsandConditionsState extends State<TermsandConditions> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height / 40,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: size.width / 0.5,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: TextButton.icon(
                              icon: Hero(
                                  tag: 1, child: Icon(Icons.arrow_back_ios)),
                              label: Text(
                                "Terms & Conditions",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width / 1.1,
                    child: Card(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: size.width / 1,
                                height: size.height / 19,
                                child: Container(
                                  color: Colors.green[800],
                                  child: Center(
                                      child: Text(
                                    "Terms & Conditions",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                                "According to the Oxford English Dictionary, hello is an alteration of hallo, hollo,[1] which came from Old High German halâ, holâ, emphatic imperative of halôn, holôn to fetch, used especially in hailing a ferryman.[5] It also connects the development of hello to the influence of an earlier form, holla, whose origin is in the French holà (roughly, 'whoa there!', from French là 'there').[6] As in addition to hello, halloo,[7] hallo, hollo, hullo and (rarely) hillo also exist as variants or related words, the word can be spelt using any of all five vowels."),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 9),
                            child: Text(
                              "IMPORTANT NOTES:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                                "According to the Oxford English Dictionary, hello is an alteration of hallo, hollo,[1] which came from Old High German halâ, holâ, emphatic imperative of halôn, holôn to fetch, used especially in hailing a ferryman.[5] It also connects the development of hello to the influence of an earlier form, holla, whose origin is in the French holà (roughly, 'whoa there!', from French là 'there').[6] As in addition to hello, halloo,[7] hallo, hollo, hullo and (rarely) hillo also exist as variants or related words, the word can be spelt using any of all five vowels."),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FlatButton(
                                  onPressed: null,
                                  child: Text('DECLINE',
                                      style:
                                          TextStyle(color: Colors.green[800])),
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.green[800]!,
                                          width: 1,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                FlatButton(
                                  onPressed: null,
                                  child: Text('ACCEPT',
                                      style:
                                          TextStyle(color: Colors.green[800])),
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.green[800]!,
                                          width: 1,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
