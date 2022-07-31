// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:homeserve/pages/login.dart';
import 'package:homeserve/services/firestore.dart';
import '../../pages/user/searchresults.dart';
import '../../model/servicemodel.dart';
import '../../themes/themes.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  List selectedList = [];

  void selectItem(index) {
    if (selectedList.contains(index)) {
      selectedList.remove(index);
    } else {
      selectedList.add(index);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 110),
              Text("Hey, ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  )),
              const SizedBox(height: 7),
              const Text("What services do you need?",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  )),
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
                    itemCount: Service.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          selectItem(index);
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
                                        offset: const Offset(2, 2),
                                        blurRadius: 5,
                                      )
                                    ]
                                  : []),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(Service.list[index].imageURL,
                                    height: 30),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  Service.list[index].name,
                                  style: const TextStyle(fontSize: 13),
                                )
                              ]),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
            ])),
        Positioned(
            bottom: 25,
            left: 36,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                "Log out?",
                style: TextStyle(color: Themes.basic),
              ),
            ))
      ]),
      floatingActionButton: selectedList.isNotEmpty
          ? FloatingActionButton(
              onPressed: () async {
                List result = await Database.searchProvider(selectedList);
                setState(() {
                  selectedList.clear();
                });

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchResults(
                              result: result,
                            )));
              },
              backgroundColor: Themes.basic,
              child: const Icon(Icons.arrow_forward),
            )
          : const SizedBox(),
    );
  }
}
