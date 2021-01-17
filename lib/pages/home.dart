import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  String imgData;
  Map theme = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    theme = data["is_day_time"]
        ? {
            "image": "day.png",
            "title_color": Colors.grey[300],
            "text_color": Colors.grey[50]
          }
        : {
            "image": "night.png",
            "title_color": Colors.grey[200],
            "text_color": Colors.grey[50]
          };

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/${theme['image']}"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(children: [
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, "/location");
                      setState(() {
                        data = result;
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: theme["title_color"],
                    ),
                    label: Text(
                      "Edit Location",
                      style: TextStyle(color: theme["title_color"]),
                    )),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data["location"],
                      style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2,
                          color: theme["text_color"]),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data["time"],
                  style: TextStyle(fontSize: 66.0, color: theme["text_color"]),
                )
              ]),
            )));
  }
}
