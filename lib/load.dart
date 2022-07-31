// ignore_for_file: override_on_non_overriding_member

import 'dart:async';

import 'package:flutter/material.dart';

import 'welcome.dart';

class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  late String userkey;
  late bool auth;

  @override
  getBoolValuesSF() async {
    setState(() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Welcome()));
    });
  }

  void initState() {
    super.initState();
    Timer(Duration(seconds: 6), () => getBoolValuesSF());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Image(
          image: AssetImage('assets/splesh.jpg'),
          width: 70,
          fit: BoxFit.fill,
        ));
  }
}
