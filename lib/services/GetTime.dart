import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class GetTime {
  late String currentTime;
  String location;
  String falg;
  String url;
  late bool isDayTime;
  late DateTime nowTime;

  GetTime({required this.location, required this.falg, required this.url});

  Future<void> getTime() async {
    Response responseTime = await get(
      Uri.parse("http://worldtimeapi.org/api/timezone/$url"),
    );
    // print(responseTime.body);

    //convert response to jsondata
    Map data = jsonDecode(responseTime.body);
    // print('data["datetime"] = ' + data["datetime"]);

    //extract datetime from data as string
    String dateTime = data["datetime"];
    // print(dateTime);
    //convert string datetime to datetime
     nowTime = DateTime.parse(dateTime);

    String utc_Offset = data["utc_offset"];
    // print(utc_Offset);

    // print(nowTime);
    if (utc_Offset.substring(0, 1) == "+") {
      nowTime =
          nowTime.add(Duration(hours: int.parse(utc_Offset.substring(1, 3))));
      nowTime =
          nowTime.add(Duration(minutes: int.parse(utc_Offset.substring(4, 6))));
      // print(nowTime);
    } else {
      nowTime =
          nowTime.subtract(Duration(hours: int.parse(utc_Offset.substring(1, 3))));
      nowTime =
          nowTime.subtract(Duration(minutes: int.parse(utc_Offset.substring(4, 6))));
      // print(nowTime);
    }

    isDayTime = nowTime.hour >= 6 && nowTime.hour < 20 ? true : false;
    currentTime = DateFormat.jm().format(nowTime);


    //  catch (e) {
    //   print("Error Cought in GetTime()");
    // }
  }
}
