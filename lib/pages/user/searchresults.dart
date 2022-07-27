import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homeserve/model/servicemodel.dart';
import 'package:homeserve/services/firestore.dart';

class SearchResults extends StatelessWidget {
  SearchResults({required this.ind});

  int ind = 0;

  static final Stream<QuerySnapshot> provider =
      FirebaseFirestore.instance.collection('person').snapshots();

  static dynamic result = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 13),
            child: Text(
              Service.services[ind].name,
              style: TextStyle(color: Colors.black),
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
            child: StreamBuilder(
                stream: provider,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Text("loading",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic));
                  final data = snapshot.requireData;

                  return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: ((context, index) {
                        if (data.docs[index]['Service'] ==
                            Service.services[ind].name)
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.docs[index]['name'],
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                data.docs[index]['email'],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black45),
                              ),
                              Divider(thickness: 1)
                            ],
                          );
                        else
                          return SizedBox(
                            height: 2,
                          );
                      }));
                })));
  }
}
