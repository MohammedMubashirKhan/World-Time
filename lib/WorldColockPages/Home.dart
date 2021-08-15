import 'dart:async';
import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map dataFromLoading = {};
  late Timer timer;
  late DateTime updateTime;

  var battery = Battery();
  Future<void> printBatteryLevel() async {
    print(await battery.batteryLevel);
    print(await battery.isInBatterySaveMode);
    // print( battery.);

    battery.onBatteryStateChanged.listen((event) {
      print("HELLO");
    });
  }

  @override
  Widget build(BuildContext context) {
    if (dataFromLoading.isEmpty) {
      dataFromLoading = ModalRoute.of(context)!.settings.arguments as Map;
    }
    printBatteryLevel();

    return Scaffold(
      backgroundColor: dataFromLoading["isDayTime"]
          ? Colors.blue[200]
          : Colors.blueGrey[800],
      // appBar: AppBar(
      //     title: ,
      //     ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: dataFromLoading["isDayTime"]
              ? AssetImage("assets/morning.jpg")
              : AssetImage("assets/night.jpg"),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, "/location");
                    if (result != null) {
                      setState(() {
                        dataFromLoading = {
                          "time": result["time"],
                          "location": result["location"],
                          "flag": result["falg"],
                          "isDayTime": result["isDayTime"],
                        };
                      });
                    }
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: dataFromLoading["isDayTime"]
                        ? Colors.black
                        : Colors.white,
                  ),
                  label: Text(
                    "Edit Location",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: dataFromLoading["isDayTime"]
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dataFromLoading["location"],
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: dataFromLoading["isDayTime"]
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  dataFromLoading["time"],
                  style: TextStyle(
                    fontSize: 70.0,
                    color: dataFromLoading["isDayTime"]
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
