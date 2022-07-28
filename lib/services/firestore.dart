import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homeserve/model/usermodel.dart';

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
}
