import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:word_time/services/GetTime.dart';

class MapTesting extends StatefulWidget {
  const MapTesting({Key? key}) : super(key: key);

  @override
  _MapTestingState createState() => _MapTestingState();
}

class _MapTestingState extends State<MapTesting> {
  late List countryRegion;
  Map<String, String> region = {};
  String testCurrentTime = "";
  int forOneTap = -1;

  void createList() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Navigator.pushReplacementNamed(context, "/noNetwork");
    } else {
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/"));
      countryRegion = jsonDecode(response.body);
      // print(countryRegion[0]);
      List test;
      for (var i = 0; i < countryRegion.length; i++) {
        test = countryRegion[i].split("/");
        // region["${test[0]}"] =  "${test[1]}";
        region.addEntries(test[1]);
        print(region[test[1]]);
        // region.add(test[test.length - 1]);
        // print(test[test.length - 1]);
      }
      // print(region);
      // region.sort();
      // print(countryRegion);
      countryRegion.sort();
      // print(countryRegion);
      // print(region.length);
      setState(() {});
    }
  }

  // void popDataToHomeScreen(index) async {
  //   GetTime instance = GetTime(
  //       location: region[index],
  //       falg: region[index],
  //       url: countryRegion[index]);
  //   await instance.getTime();
  //   testCurrentTime = instance.currentTime;
  //   setState(() {});
  //   print(instance.currentTime);
  //   print(instance.location);
  //   print(instance.falg);
  //   print(instance.isDayTime);
  //   Navigator.pop(context, {
  //     "time": instance.currentTime,
  //     "location": instance.location,
  //     "flag": instance.falg,
  //     "isDayTime": instance.isDayTime,
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState=
    super.initState();
    createList();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    //  Scaffold(
    //     backgroundColor: Colors.grey[200],
    //     appBar: AppBar(
    //       title: Text("Choose Location"),
    //       backgroundColor: Colors.blue[900],
    //       centerTitle: true,
    //       elevation: 0.0,
    //     ),
    //     body: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: ListView.builder(
    //           itemCount: region.length,
    //           itemBuilder: (context, index) {
    //             return Card(
    //               child: ListTile(
    //                 title: Text(
    //                   region[index],
    //                   style: TextStyle(
    //                     color: Colors.black,
    //                     fontSize: 25.0,
    //                   ),
    //                 ),
    //                 onTap: () {
    //                   popDataToHomeScreen(index);
    //                 },
    //                 subtitle:
    //                     index == forOneTap ? Text(testCurrentTime) : Text(""),
    //               ),
    //               color: Colors.blue[100],
    //             );
    //           }),
    //     ),
    //     floatingActionButton: SizedBox(
    //       height: 90,
    //       width: 90,
    //       child: FloatingActionButton(
    //         onPressed: () {
    //           setState(() {});
    //         },
    //         child: Text(
    //           "Generate List",
    //           style: TextStyle(
    //             fontSize: 18.0,
    //           ),
    //           textAlign: TextAlign.center,
    //         ),
    //       ),
    //     ));
  }
}
