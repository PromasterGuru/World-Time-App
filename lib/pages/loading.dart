import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/pages/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitPumpingHeart(
        color: Colors.blue[900],
        size: 100.0,
      ),
    ));
  }

  void setupWorldTime() async {
    WorldTime worldTime =
        WorldTime(location: "Kenya", flag: "kenya.png", url: 'Africa/Nairobi');
    Map result = await worldTime.getTime();
    Navigator.pushNamed(context, "/home", arguments: result);
  }
}
