import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NoNetwork extends StatelessWidget {
  const NoNetwork({Key? key}) : super(key: key);

  void checkInternetConnection(context) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      print("Connected to Modile Data");
      Navigator.pushReplacementNamed(context, "/loading");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("Connected to WiFi");
      Navigator.pushReplacementNamed(context, "/loading");
    } else {
      print("No Internet Acces");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No Internet Connection",
                style: TextStyle(fontSize: 20.0),
              ),
              ElevatedButton(
                onPressed: () {
                  checkInternetConnection(context);
                },
                child: Text(
                  "Reload",
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
