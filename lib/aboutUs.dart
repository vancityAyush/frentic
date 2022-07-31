import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Stack(children: [
            Column(children: [
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
                          icon: Hero(tag: 1, child: Icon(Icons.arrow_back_ios)),
                          label: Text(
                            "About Us",
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
              Stack(
                children: [
                  SizedBox(
                      width: size.width,
                      height: size.height / 4,
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/meeting.jpg'),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: size.height / 5),
                    child: Center(
                      child: Stack(
                        children: [
                          SizedBox(
                            width: size.width / 1.1,
                            child: Card(
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 26, left: 7),
                                    child: Text(
                                      "Who We Are...",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.green[800],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 30, left: 7),
                                    child: Text(
                                        "According to the Oxford English Dictionary, hello is an alteration of hallo, hollo,[1] which came from Old High German halâ, holâ, emphatic imperative of halôn, holôn to fetch, used especially in hailing a ferryman.[5] It also connects the development of hello to the influence of an earlier form, holla, whose origin is in the French holà (roughly, 'whoa there!', from French là 'there').[6] As in addition to hello, halloo,[7] hallo, hollo, hullo and (rarely) hillo also exist as variants or related words, the word can be spelt using any of all five vowels."),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 2.3,
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width / 1.6),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 0.7,
                                color: Colors.black,
                                spreadRadius: 0.8)
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          //backgroundImage: AssetImage('assets/logo.JPG'),
                          child: Image(
                            image: AssetImage('assets/logo.JPG'),
                          ),
                          radius: 42,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ])
          ]),
        ),
      ),
    );
  }
}
