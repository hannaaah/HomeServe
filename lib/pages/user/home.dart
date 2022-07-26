import 'package:flutter/material.dart';

class UserHome extends StatelessWidget {
  UserHome({Key? key, required this.name}) : super(key: key);

  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 100),
              Text("Hello,",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400)),
              SizedBox(height: 11),
              Text(name,
                  style: TextStyle(fontSize: 29, fontWeight: FontWeight.w600)),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.white,
                        height: 50,
                        width: 50,
                      )
                    ],
                  )
                ],
              )
            ])));
  }
}
