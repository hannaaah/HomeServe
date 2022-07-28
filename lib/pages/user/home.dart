import 'package:flutter/material.dart';
import 'package:homeserve/services/firestore.dart';
import '../../pages/user/searchresults.dart';
import '../../model/servicemodel.dart';
import '../../model/usermodel.dart';
import '../../themes/themes.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 110),
              Text("Hey, ",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Themes.basic)),
              const SizedBox(height: 7),
              const Text("What services do you need?",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  )),
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
                    itemCount: Service.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () async {
                          //      List result = await Database.searchProvider(index);
                          List result = await Database.searchProvider([0, 1]);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchResults(
                                        result: result,
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
              )
            ])));
  }
}
