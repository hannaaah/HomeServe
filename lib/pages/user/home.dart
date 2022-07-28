// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:homeserve/model/servicemodel.dart';
import 'package:homeserve/pages/user/searchresults.dart';
import 'package:homeserve/services/firestore.dart';
import 'package:homeserve/themes/themes.dart';

class UserHome extends StatefulWidget {
  UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  List selectedList = [];

  void selectItem(index) {
    if(selectedList.contains(index)){
      selectedList.remove(index);
    } else {
      selectedList.add(index);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 110),
              const Text("Hello,",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
              const SizedBox(height: 7),
              const Text("What service do you need?",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 20.0,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: Service.services.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                        
                          selectItem(index);

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SearchResults(
                          //               ind: index,
                          //             )));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: selectedList.contains(index)
                                  ? Colors.blue.shade100
                                  : Colors.grey.shade100,
                              border: Border.all(
                                color: Colors.blue.withOpacity(0),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: !selectedList.contains(index)
                                  ? [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        offset: Offset(2, 2),
                                        blurRadius: 5,
                                      )
                                    ]
                                  : []),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(Service.services[index].imageURL,
                                    height: 30),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  Service.services[index].name,
                                  style: const TextStyle(fontSize: 13),
                                )
                              ]),
                        ),
                      );
                    }),
              )
            ])),
            floatingActionButton: selectedList.isNotEmpty?
            FloatingActionButton(onPressed: (){
              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchResults(
                                        // selectedList: selectedList,
                                      )));
            },backgroundColor: Themes.basic,child: Icon(Icons.arrow_forward),)
            :SizedBox(),
            );
  }
}
