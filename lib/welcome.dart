import 'package:flutter/material.dart';
import 'Screeens/Login/login.dart';
import 'Signup.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final wid = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/login.jpg',
              width: wid,
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 45,
                        width: size.width / 1.4,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.mail_outline,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                height: 50,
                                width: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: wid / 8),
                                child: Text(
                                  'Sign up ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green[800],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 19,
                ),
                SizedBox(
                  height: 45,
                  width: size.width / 1.4,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: wid / 7),
                          child: Text(
                            'Login ',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height / 18, left: wid / 8),
                  child: Container(
                    width: size.width / 1.3,
                    child: Stack(
                      children: [
                        Text(
                          "By signing up, you agree to our privacy policy and ",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 12),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 64),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Terms & Conditions.",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
