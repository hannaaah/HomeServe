import 'package:flutter/material.dart';
import 'package:homeserve/model/servicemodel.dart';

class SearchResults extends StatelessWidget {
  SearchResults({required this.result, required this.ind});

  List result;
  int ind;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 13),
            child: Text(
              Service.list[ind].name,
              style: const TextStyle(color: Colors.black, fontSize: 21),
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
          child: ListView.builder(
              itemCount: result.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Text(result[index]['name']),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                );
              })),
        ));
  }
}
