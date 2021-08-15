import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("AppDrawer"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/loading");
              },
              child: Container(
                height: 121.0,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/worldclock.png",
                      height: 100.0,
                    ),
                    Text(
                      "World Colok",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
