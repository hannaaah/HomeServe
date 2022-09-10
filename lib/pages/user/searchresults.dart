import 'package:flutter/material.dart';
import 'package:homeserve/pages/user/datetime.dart';

import '../../services/firestore.dart';
import '../../themes/themes.dart';

class SearchResults extends StatelessWidget {
  SearchResults({Key? key, required this.result}) : super(key: key);

  List result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white38,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(top: 11, left: 0),
            child: Text(
              "Search Results",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
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
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: ListView.builder(
                itemCount: result.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    child: ProviderTile(
                        result[index]['name'],
                        result[index]['location'],
                        result[index]['service'],
                        (result[index]['rating']).toString()),
                    onTap: () async {
                      Map provider =
                          await Database.getDetails(result[index]['name']);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Datetime(
                                    map: provider,
                                  )));
                    },
                  );
                })),
          ),
        ));
  }
}

Widget ProviderTile(String name, String loc, String service, String rating) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(children: [
      const SizedBox(
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
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Themes.basic),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                loc,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                service,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              // Row(children: [
              //   for (var service in services)
              //     service == services.last ? Text(service,style: TextStyle(fontWeight: FontWeight.w500),) : Text("$service • ",style:TextStyle(fontWeight: FontWeight.w500),)
              // ])
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Themes.basic,
                size: 19,
              ),
              Text(
                rating,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
      const Divider(
        height: 30,
        thickness: 0.7,
        color: Colors.grey,
      )
    ]),
  );
}
