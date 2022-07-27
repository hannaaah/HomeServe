// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:homeserve/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:homeserve/pages/user/home.dart';

import 'pages/provider/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Login(),
      home: ProviderHome(),
    );
  }
}
