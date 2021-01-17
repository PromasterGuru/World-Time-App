import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //Location displayed on the UI
  String flag; //Asset image url for the location flag
  String url; //Location url
  String time;
  bool
      isDayTime; //Set is day.png time to true or false based on the hour of the day.png

  WorldTime({this.location, this.flag, this.url});

  Future<Map> getTime() async {
    try {
      //Make api request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map map = jsonDecode(response.body);
      DateTime datetime = DateTime.parse(map["datetime"])
          .add(Duration(hours: int.parse(map["utc_offset"].substring(1, 3))));

      isDayTime = datetime.hour > 6 && datetime.hour < 20;
      time = DateFormat.jm().format(datetime);
      return {
        "location": location,
        "flag": flag,
        "time": time,
        "is_day_time": isDayTime
      };
    } catch (e) {
      print("${this.hashCode.toString()} :  $e");
      return {};
    }
  }
}
