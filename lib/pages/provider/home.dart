// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:homeserve/pages/provider/notifications.dart';

import '../../model/usermodel.dart';
import '../../themes/themes.dart';

class ProviderHome extends StatefulWidget {
  ProviderHome({Key? key, required this.result}) : super(key: key);

  List result = [];

  @override
  State<ProviderHome> createState() => _ProviderHomeState();
}

class _ProviderHomeState extends State<ProviderHome> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade50,
        ),
        body: SizedBox(
          height: double.infinity,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: ListView(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hello!",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w500)),
                      GestureDetector(
                        child: Icon(Icons.notifications),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Notifications()));
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(User.name,
                      style: TextStyle(
                          fontSize: 29,
                          color: Themes.basic,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: (() {
                      setState(() {});
                    }),
                    child: Text(
                      "All Appointments",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ]),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.result.length,
                    itemBuilder: (context, i) {
                      return Tile(
                          widget.result[i]['time'] ?? "",
                          widget.result[i]['user'] ?? "",
                          widget.result[i]["date"] ?? "");
                    })
              ])),
        ));
  }
}

Widget Tile(String time, String name, String date) {
  return GestureDetector(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    date,
                    maxLines: 2,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                time,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 1.2,
          )
        ],
      ),
    ),
  );
}
