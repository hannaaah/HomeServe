import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homeserve/model/usermodel.dart';
import 'package:intl/intl.dart';

import '../model/servicemodel.dart';

class Database {
  static addData(String type) {
    FirebaseFirestore.instance.collection('person').add({
      'name': User.name,
      'phone': User.phone,
      'location': User.loc,
      'email': User.email,
      'type': type,
      'service': User.service,
      'rating': 4
    });
  }

  static getUser(String email) async {
    await FirebaseFirestore.instance
        .collection('person')
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      User.name = querySnapshot.docs.first['name'];
      User.type = querySnapshot.docs.first['type'];
    });
  }

  static getDetails(String name) async {
    Map<String, dynamic> provider = {};
    await FirebaseFirestore.instance
        .collection('person')
        .where('name', isEqualTo: name)
        .get()
        .then((QuerySnapshot querySnapshot) {
      provider['name'] = querySnapshot.docs.first['name'];
      provider['email'] = querySnapshot.docs.first['email'];
      provider['phone'] = querySnapshot.docs.first['phone'];
      provider['rating'] = querySnapshot.docs.first['rating'];
      provider['location'] = querySnapshot.docs.first['location'];
      provider['service'] = querySnapshot.docs.first['service'];
    });
    return provider;
  }

  static searchProvider(List index) async {
    List services = [];
    for (int i = 0; i < Service.list.length; i++) {
      if (index.contains(i)) {
        services.add(Service.list[i].name);
      }
    }
    List result = [];
    await FirebaseFirestore.instance
        .collection('person')
        .orderBy('rating', descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (services.contains(doc['service'])) result.add(doc);
      });
    });
    return result;
  }

  static bookings() async {
    List result = [];
    await FirebaseFirestore.instance.collection('requests')
      ..orderBy(
        'date',
      ).get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          if (doc['provider'] == User.name) result.add(doc);
        });
      });

    return result;
  }

  static bookService(Map provider, DateTime date, TimeOfDay time) async {
    await FirebaseFirestore.instance.collection('requests').add({
      'user': User.name,
      'loc': User.loc,
      'provider': provider['name'],
      'email': provider['email'],
      'phone': provider['phone'],
      'date': DateFormat.yMMMd().format(date),
      'time': time.hour.toString() +
          ":" +
          time.minute.toString() +
          " " +
          ((time.period.toString())
              .substring((time.period.toString()).length - 2)
              .toUpperCase()),
      'now': DateFormat.yMMMd().format(DateTime.now())
    });
  }
}
