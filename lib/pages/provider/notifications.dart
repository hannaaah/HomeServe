import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homeserve/themes/themes.dart';

import '../../model/usermodel.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final Stream<QuerySnapshot> bookingStream =
      FirebaseFirestore.instance.collection('requests').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white38,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(top: 11, left: 0),
            child: Text(
              "Notifications",
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
        body: StreamBuilder<QuerySnapshot>(
          stream: bookingStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: Themes.basic,
              ));
            }
            final data = snapshot.requireData;
            List res = [];
            for (int i = 0; i < snapshot.data!.size; i++) {
              if (data.docs[i]['provider'] == User.name) res.add(data.docs[i]);
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 24),
              child: ListView.builder(
                  itemCount: res.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "${res[index]['user']} ",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              children: <TextSpan>[
                                const TextSpan(
                                  text: " has booked your service on  ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                TextSpan(
                                  text: "${res[index]['date']} ",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                const TextSpan(
                                    text: "at ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                  text: "${(res[index]['time'])}.   ",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                 TextSpan(
                                  text:  (res[index]['now']).toString().substring(
                                  0, (res[index]['now']).toString().length - 6),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                                ),
                              ]),
                        ),
                     
                      
                        const SizedBox(
                          height: 18,
                        ),
                      ],
                    );
                  })),
            );
          },
        ));
  }
}
