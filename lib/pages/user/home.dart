import 'package:flutter/material.dart';
import 'package:homeserve/model/servicemodel.dart';
import 'package:homeserve/pages/user/searchresults.dart';
import 'package:homeserve/services/firestore.dart';

class UserHome extends StatelessWidget {
  UserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchResults(
                                        ind: index,
                                      )));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border.all(
                              color: Colors.blue.withOpacity(0),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
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
            ])));
  }
}
