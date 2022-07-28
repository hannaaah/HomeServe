// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homeserve/model/servicemodel.dart';
import 'package:homeserve/services/firestore.dart';
import 'package:homeserve/themes/themes.dart';

class Providers {
  final String name;
  final String phno;
  List<String> services = [];
  final double rating;

  Providers(this.name, this.phno, this.services, this.rating);
}

List<Providers> list = [
  Providers("Samuel", "+919823344556", ["Plumbing", "Cleaning"], 4.5),
  Providers("Jone", "+919945678382", ["Plumbing"], 3.4),
  Providers("Abhishek", "+919207086132", ["Cleaning"], 4.8)
];

class SearchResults extends StatelessWidget {
  SearchResults();

  // List selectedList;

  // static final Stream<QuerySnapshot> provider =
  //     FirebaseFirestore.instance.collection('person').snapshots();

  // static dynamic result = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 13),
            child: Text(
              "Service Providers",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.white38,
          elevation: 0,
          leading: SizedBox(
            width: 60,
            height: 70,
            child: GestureDetector(
              onTap: (() {
                Navigator.pop(context);
              }),
              child: const Padding(
                padding: EdgeInsets.all(24.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(24),
            // child: StreamBuilder(
            //     stream: provider,
            //     builder: (BuildContext context, AsyncSnapshot snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting)
            //         return Text("loading",
            //             style: TextStyle(
            //                 fontSize: 19,
            //                 color: Colors.grey,
            //                 fontStyle: FontStyle.italic));
            //       final data = snapshot.requireData;

            //       return
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: ((context, index) {
                  return ProviderTile(list[index].name, list[index].phno,
                      list[index].services, list[index].rating);
                }))));
  }
}


Widget ProviderTile(
    String name, String phno, List<String> services, double rating) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Column(children: [
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Themes.basic),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                phno,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(children: [
                for (var service in services)
                  service == services.last ? Text(service,style: TextStyle(fontWeight: FontWeight.w500),) : Text("$service • ",style:TextStyle(fontWeight: FontWeight.w500),)
              ])
            ],
          ),
          Row(
            children: [
              Icon(Icons.star_border,color: Themes.basic,),
              Text(
                "$rating",
                style: TextStyle(fontSize: 20),
              ),
            ],
          )
        ],
      ),
      Divider(
        thickness: 1,
        color: Colors.grey.shade600,
      )
    ]),
  );
}
