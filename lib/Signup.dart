import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frentic/api/AppConstant.dart';
import 'package:frentic/api/apiManager.dart';
import 'package:frentic/api/sharedprefrence.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home_page.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _city = TextEditingController();
  bool isLoad = false;
  final _formKey = GlobalKey<FormState>();
  late bool msg;
  bool phn = false;
  late bool nam;
  String city = "";
  String message = "";
  String currentlocationcity = "City";
  String latitude = "00";
  String longitude = "00";
  var dio = Dio();

  var rsDio;

  void setcity() {
    if (_city.text == "") {
      if (currentlocationcity == "City") {
        setState(() {
          currentlocationcity = "";
        });
      }
      setState(() {
        city = currentlocationcity;
      });
    } else {
      city = _city.text;
    }
  }

  void getcity() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(28.628454, 77.376945);
    print(placemarks.first.subLocality);
    print(placemarks.first.locality);
    setState(() {
      currentlocationcity =
          "${placemarks.first.subLocality.toString()} , ${placemarks.first.locality.toString()}";
      _city.text = currentlocationcity;
    });
  }

  addBoolToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('boolValue', true);
  }

  void postData() async {
    String key = await SharedPrefManager.getPrefrenceString(AppConstant.KEY);

    print("data posted ++++++++++++++++++++++++=======");
    print(key);
    rsDio = await dio.post(
        'https://api.trackier.com/v2/publishers?apiKey=61eea1a4445e29fb98cefbc3b5461eea1a444613',
        data: {
          "name": _name.text,
          "email": _email.text,
          "password": _password.text,
          "phone": _phone.text,
          "tags": ["string"]
        });

    print("Response of 3rd party Api ::::: --->  " +
        rsDio.data['publisher']['id'].toString());

    await SharedPrefManager.savePublisherId(
        "publisherId", rsDio.data['publisher']['id'].toString());

    await Provider.of<ApiManager>(context, listen: false)
        .editProfileApi(rsDio.data['publisher']['id'].toString());

    final response = await post(Uri.parse(url), body: {
      "name": _name.text,
      "email": _email.text,
      "phone": _phone.text,
      "address": city,
      "latitude": latitude,
      "longitude": longitude,
    });
    print(response.body);
    final jsonData = jsonDecode(response.body);
    var data = jsonData['error_code'].toString();
    print(data.runtimeType);
    if (data == "1") {
      await addBoolToSF();
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
    if (data == "0") {
      String response_string = jsonData['response_string'].toString();
      if (response_string ==
          "The phone field must contain a unique value.\nThe email field must contain a unique value.\n") {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Already registered"),
            );
          },
        );
      } else {
        if (response_string ==
            "The phone field must contain a unique value.\n") {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Use different Number"),
              );
            },
          );
        } else {
          if (response_string ==
              "The email field must contain a unique value.\n") {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Use different E-mail"),
                );
              },
            );
          }
        }
      }
    }
  }

  /*Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  } */
  ////////-----------Url---------------////////
  final url = "http://cashera.frantic.in/RestApi/register_user";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height / 20,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  width: size.width / 0.5,
                  child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      })),
              SizedBox(
                height: size.height / 50,
              ),
              Container(
                width: size.width / 1.1,
                child: Text(
                  "Create New Account",
                  style: TextStyle(fontSize: 28, color: Colors.green[800]),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                  child: Image(
                      height: 120, image: AssetImage('assets/logo/edit.png'))),
              SizedBox(
                height: 24,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        elevation: 8,
                        shadowColor: Colors.green[800],
                        child: SizedBox(
                          height: 45,
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: TextField(
                              controller: _name,
                              onChanged: (_name) {
                                bool valid =
                                    RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                                        .hasMatch(_name);
                                print(valid);
                                setState(() {
                                  nam = valid;
                                  print(nam);
                                });
                              },
                              decoration: InputDecoration(
                                //labelText: '  E-mail or Phone Number',
                                hintText: 'Name ',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        elevation: 8,
                        shadowColor: Colors.green[800],
                        child: SizedBox(
                          height: 45,
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: TextField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (_email) {
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.com+")
                                    .hasMatch(_email);
                                print(emailValid);
                                setState(() {
                                  msg = emailValid;
                                  print(msg);
                                });
                              },
                              decoration: InputDecoration(
                                //labelText: '  E-mail or Phone Number',
                                hintText: 'E-mail',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        elevation: 8,
                        shadowColor: Colors.green[800],
                        child: SizedBox(
                          height: 45,
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: TextField(
                              controller: _phone,
                              keyboardType: TextInputType.number,
                              onChanged: (_phone) {
                                setState(() {
                                  if (_phone.length == 10) {
                                    print("true");

                                    phn = true;
                                  } else {
                                    phn = false;
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                // labelText: '  Date of Birth',
                                hintText: 'Phone Number',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        elevation: 8,
                        shadowColor: Colors.green[800],
                        child: SizedBox(
                          height: 45,
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: TextField(
                              controller: _password,
                              keyboardType: TextInputType.number,
                              onChanged: (_phone) {
                                setState(() {
                                  if (_phone.length > 5) {
                                    print("true");

                                    phn = true;
                                  } else {
                                    phn = false;
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                // labelText: '  Date of Birth',
                                hintText: 'Password',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        elevation: 8,
                        shadowColor: Colors.green[800],
                        child: SizedBox(
                          height: 45,
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: TextField(
                              controller: _city,
                              decoration: InputDecoration(
                                //labelText: '  Select Gender',
                                hintText: "City",
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    getcity();
                                  },
                                  icon: Icon(Icons.location_on_outlined),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              if (isLoad == true)
                CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: () async {
                    if (_name.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Enter name");
                    } else if (_email.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Enter email");
                    } else if (_phone.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Enter Phone Number");
                    } else if (_phone.text.length != 10) {
                      Fluttertoast.showToast(
                          msg: "Number should have 10 digits");
                    } else if (_city.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Enter city");
                    } else if (_password.text.length < 5) {
                      Fluttertoast.showToast(
                          msg: "The Password should have atleast 5 characters");
                    } else {
                      setState(() {
                        isLoad = true;
                      });
                      await Provider.of<ApiManager>(context, listen: false)
                          .registerUserApi(_name.text, _phone.text, _email.text,
                              _city.text, latitude, longitude);
                      postData();

                      setState(() {
                        isLoad = false;
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(124, 0, 124, 0),
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green[800],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                )
            ],
          ),
        ),
      ),
    );
  }
}
//Material(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         elevation: 8,
//                         shadowColor: Colors.green[800],
//                         child: SizedBox(
//                           height: 45,
//                           width: 200,
//                           child: TextField(
//                             decoration: InputDecoration(
//                               labelText: 'Last Name',
//                               hintText: 'Last Name',
//                               focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(width: 0),
//                                   borderRadius: BorderRadius.all(Radius.circular(20))
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(width: 0),
//                                   borderRadius: BorderRadius.all(Radius.circular(20))
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                  ]
//               ),
