// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:homeserve/themes/themes.dart';

// class MockData {
//   String? name;
//   String? addr;
//   String? time;

//   MockData(name, addr, time);
// }

List<Map<String,String>> list = [
  {
    "name":"Mary Varghese",
    "addr":"76 Sector Manek Complex,\nHotel Andheri",
    "time":"10:00 AM"
  },
  {
    "name":"Arun",
    "addr":"46 Sector Manek Complex,\nHotel Andheri",
    "time":"11:00 AM"
  },
  {
    "name":"Jessa",
    "addr":"123 Sector Manek Complex,\nHotel Andheri",
    "time":"2:00 PM"
  },
  {
    "name":"Jacob",
    "addr":"54 Sector Manek Complex,\nHotel Andheri",
    "time":"3:00 PM"
  },
];

class ProviderHome extends StatelessWidget {
  const ProviderHome({Key? key}) : super(key: key);

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
                      Icon(Icons.chat_bubble_outline_outlined),
                    ],
                  ),
                  SizedBox(height: 11),
                  Text("John Samuel",
                      style:
                          TextStyle(fontSize: 29,color: Themes.basic, fontWeight: FontWeight.w600)),
                  SizedBox(height: 23),
                  Text(
                    'My Appointments',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 23),
                  Text(
                    'Today',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 15,)
                ]),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, i) {
                      return Tile(list[i]["time"]??"", list[i]["name"]??"", list[i]["addr"]??"");
                    })
              ])),
        ));
  }
}

Widget Tile(String time, String name, String addr) {
  return GestureDetector(
    onTap: (){
      //TODO: Funtioinality to be added
    },
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    addr,
                    maxLines: 2,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                time,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 2,
          )
        ],
      ),
    ),
  );
}
