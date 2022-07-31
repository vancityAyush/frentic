import 'package:flutter/material.dart';
import 'package:frentic/api/apiManager.dart';
import 'package:frentic/api/apiresponse/responseprofile.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ResponseProfile responseProfile = ResponseProfile();

  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    var future =
        Provider.of<ApiManager>(context, listen: false).fetchProfileApi();
    future.then((value) {
      setState(() {
        responseProfile = value!;
        nameController.text = value.data!.name!;
        genderController.text = value.data!.gender ?? "Male";
        dateOfBirthController.text = value.data!.dob ?? "01-01-2000";
        emailController.text = value.data!.email!;
        locationController.text = value.data!.name!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final wid = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: responseProfile.data == null
            ? Center(child: CircularProgressIndicator())
            : Container(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
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
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    child: TextButton.icon(
                                        icon: Hero(
                                            tag: 1,
                                            child: Icon(Icons.arrow_back_ios)),
                                        label: Text(
                                          "Profile",
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
                              )),
                          SizedBox(
                            width: size.width,
                            height: size.height / 4,
                            child: Container(
                              color: Color.fromRGBO(126, 126, 237, 1),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 12, top: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            children: [
                                              Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                "Edit",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Row(
                                        children: [
                                          Card(
                                            child: Container(
                                              height: size.height / 6,
                                              width: size.width / 3.6,
                                              child: Image(
                                                  image: AssetImage(
                                                      'assets/cooler.png')),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 14),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    responseProfile.data!.name!,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12, bottom: 12),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 12),
                                                        child: Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text("Delhi",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                    width: size.width / 1.7,
                                                    child: Text(
                                                        "Hello, with that spelling, the Norwich Courier of Norwich, Connecticut.",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                        ))),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: size.height / 16),
                            child: SizedBox(
                              height: size.height / 13,
                              width: size.width / 1.2,
                              child: TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: "Your Name",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green[800]!),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green[800]!),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green[800]!),
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: size.height / 13,
                            width: size.width / 1.2,
                            child: TextField(
                                controller: genderController,
                                decoration: InputDecoration(
                                  hintText: "Gender",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green[800]!),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green[800]!),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green[800]!),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: size.height / 13,
                            width: size.width / 1.2,
                            child: TextField(
                                controller: dateOfBirthController,
                                decoration: InputDecoration(
                                  hintText: "Date of Birth",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green[800]!),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green[800]!),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green[800]!),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: size.height / 13,
                            width: size.width / 1.2,
                            child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: "Your Email",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green[800]!),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green[800]!),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green[800]!),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: size.height / 7,
                            width: size.width / 1.2,
                            child: TextField(
                                controller: locationController,
                                decoration: InputDecoration(
                                  hintText: "Location",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green[800]!),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green[800]!),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green[800]!),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: size.width / 1.2,
                            child: SizedBox(
                              height: 40,
                              width: size.width / 1.4,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: wid / 3.5),
                                      child: Text(
                                        'Save ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green[800],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                              ),
                            ),
                          ),
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
