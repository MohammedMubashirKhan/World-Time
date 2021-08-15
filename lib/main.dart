import 'package:flutter/material.dart';
import 'AppDrawer/AppDrawer.dart';

import 'WorldColockPages/Home.dart';
import 'WorldColockPages/Map_Testing.dart';
import 'WorldColockPages/NoNetwork.dart';
import 'WorldColockPages/choose_location.dart';
import 'WorldColockPages/loading.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     // systemNavigationBarColor: Colors.pink,
  //     statusBarColor: Color(0x6FFFFFFF),
  //     systemNavigationBarDividerColor: Colors.red));
  runApp(MaterialApp(
    initialRoute: "/appDrawer",
    routes: {
      "/loading": (context) => Loading(),
      "/home": (context) => Home(),
      "/location": (context) => ChooseLocation(),
      "/noNetwork": (context) => NoNetwork(),
      "/appDrawer": (context) => AppDrawer(),
      
      "/mapTesting": (context) => MapTesting(),
    },
  ));
}

/*  http: ^0.13.3
  intl: ^0.17.0
  flutter_spinkit: ^5.0.0
  */ 