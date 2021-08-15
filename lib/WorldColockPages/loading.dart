import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:word_time/services/GetTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String displayTime = "loading";
  bool waiting = true;

  void setupWorldTime() async {
    GetTime currentTime =
        GetTime(location: "Kalkatta", falg: "india.png", url: "Asia/Kolkata");
    await currentTime.getTime();
    // setState(() {
    //   displayTime = currentTime.currentTime;
    // });

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "time": currentTime.currentTime,
      "location": currentTime.location,
      "flag": currentTime.falg,
      "isDayTime": currentTime.isDayTime,
      "changeTime": currentTime.nowTime,
    });
  }

  void checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      // print("Connected to Modile Data");
      setupWorldTime();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // print("Connected to WiFi");
      setupWorldTime();
    } else {
      Navigator.pushReplacementNamed(context, "/noNetwork");
    }
  }

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitWave(
        color: Colors.white,
        size: 150.0,
      )),
    );
  }
}
