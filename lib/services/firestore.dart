import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homeserve/model/servicemodel.dart';
import 'package:homeserve/model/usermodel.dart';

class Database {
  static CollectionReference person =
      FirebaseFirestore.instance.collection('person');

  static addData(String type) {
    person.add({
      'name': User.name,
      'phone': User.phone,
      'location': User.loc,
      'email': User.email,
      'type': type,
      'service': User.service
    });
  }
}
