// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frentic/api/AppConstant.dart';
import 'package:frentic/api/apiManager.dart';
import 'package:frentic/api/sharedprefrence.dart';
import 'package:http/http.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _name = TextEditingController();
  bool isLoad = false, isLoadOtp = false;

  late bool msg;
  late bool phn;
  late String info;
  late String userkey;
  String onetimepassword = "Fill Correct E-mail and Phone number";
  String pin = "";
  final url = "http://cashera.frantic.in/RestApi/set_verify_otp";
  final url2 = "http://cashera.frantic.in/RestApi/verify_otp";

  addBoolToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('boolValue', true);
  }

  void getuserkey() async {
    final response1 = await post(Uri.parse(url2), body: {
      "username": _name.text.toString(),
      "otp": pin.toString(),
    });
    print(response1.body);
    var jsonData1 = jsonDecode(response1.body);
    setState(() {
      userkey = jsonData1['data'].toString();
    });
  }

  void postData() async {
    final response = await post(Uri.parse(url), body: {
      "username": _name.text.toString(),
    });
    print(response.body);
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    setState(() {
      if (jsonData['data'] == null) {
        onetimepassword = "Invalid User";
      } else {
        onetimepassword = jsonData['data'].toString();
      }
    });
  }

  List<Widget> otp = [
    Container(),
  ];
  double open = 0.0;
  bool isSwitched = false;
  var textValue = 'OFF';
  TextEditingController newTextEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  void dispose() {
    newTextEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'ON';
      });
      print('Remember ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'OFF';
      });
      print('Remember OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
                  },
                ),
              ),
              SizedBox(
                height: size.height / 50,
              ),
              Container(
                width: size.width / 1.1,
                child: Text(
                  "Log In",
                  style: TextStyle(fontSize: 28, color: Colors.green[800]),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Hero(
                  tag: 1,
                  child: Image(
                    image: AssetImage('assets/logo/male-user-shadow.png'),
                    width: 70,
                    color: Colors.green[800],
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 7, 0, 0),
                          child: Material(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            elevation: 8,
                            shadowColor: Colors.green[800],
                            child: SizedBox(
                              height: 53,
                              width: 300,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(52, 0, 0, 0),
                                child: TextField(
                                  controller: _name,
                                  onChanged: (_name) {
                                    open = 1.0;
                                    if (_name == "") {
                                      open = 0.0;
                                    }
                                    setState(() {});
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'E-Mail and Phone number',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30, width: 40),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: Colors.green[800]!,
                                  spreadRadius: 1)
                            ],
                          ),
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 32,
                              child: Image(
                                image: AssetImage(
                                    'assets/logo/male-user-shadow.png'),
                                width: 26,
                                color: Colors.green[800],
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (isLoad == true)
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 50.0, top: 10, bottom: 10),
                      child: CircularProgressIndicator(),
                    ))
              else
                Opacity(
                  opacity: open,
                  child: FlatButton(
                    onPressed: () async {
                      setState(() {
                        isLoad = true;
                      });

                      await Provider.of<ApiManager>(context, listen: false)
                          .loginApi(_name.text);

                      setState(() {
                        isLoad = false;
                      });
                      /*if (onetimepassword.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(onetimepassword),
                          );
                        },
                      );
                    }*/
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width / 1.7, top: 8),
                      child: Text(
                        "Get Otp",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              Container(
                child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Stack(children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(12, 7, 0, 0),
                          child: Material(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              elevation: 8,
                              shadowColor: Colors.green[800],
                              child: SizedBox(
                                  height: 53,
                                  width: 300,
                                  child: Container(
                                      width: 320,
                                      color: Colors.transparent,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0))),
                                          child: new Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 55,
                                                right: 25,
                                              ),
                                              child: PinCodeTextField(
                                                appContext: context,
                                                onChanged: (String value) {
                                                  setState(() {
                                                    pin = value.toString();
                                                  });
                                                },
                                                length: 5,
                                              ),
                                            ),
                                          )))))),
                      SizedBox(height: 30, width: 40),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color: Colors.green[800]!,
                                spreadRadius: 1)
                          ],
                        ),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 32,
                            child: Image(
                              image: AssetImage('assets/logo/otp.png'),
                              width: 31,
                              color: Colors.green[800],
                            )),
                      ),
                    ])),
              ),
              //feilds==0?_password():

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, size.width / 7, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Remember Me"),
                    Transform.scale(
                        scale: 1,
                        child: Switch(
                          onChanged: toggleSwitch,
                          value: isSwitched,
                          activeColor: Colors.black26,
                          activeTrackColor: Colors.green[800],
                          inactiveThumbColor: Colors.green[800],
                          inactiveTrackColor: Colors.black26,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              if (isLoadOtp)
                CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: () async {
                    var name = await SharedPrefManager.getPrefrenceString(
                        AppConstant.NAME);
                    var otp = await SharedPrefManager.getPrefrenceString(
                        AppConstant.OTP);

                    setState(() {
                      isLoadOtp = true;
                    });

                    await Provider.of<ApiManager>(context, listen: false)
                        .verifyOtpApi(name, otp);

                    setState(() {
                      isLoadOtp = false;
                    });
                    // getuserkey();

                    /*if (pin == onetimepassword) {
                    addBoolToSF();
                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        Home()), (Route<dynamic> route) => false);
                  }*/ /*else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(" Incorrect OTP"),
                        );
                      },
                    );
                  }*/
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green[800],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              TextButton(onPressed: () {}, child: Text("Forget Password?"))
            ],
          ),
        ),
      ),
    );
  }
}

//fetch_brands//
