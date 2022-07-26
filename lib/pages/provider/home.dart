import 'package:flutter/material.dart';

class ProviderHome extends StatelessWidget {
  const ProviderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 100),
                  Text("Hello,",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w400)),
                  SizedBox(height: 11),
                  Text("John Samuel",
                      style:
                          TextStyle(fontSize: 29, fontWeight: FontWeight.w600)),
                ])));
  }
}
