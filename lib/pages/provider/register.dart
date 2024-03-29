import 'package:flutter/material.dart';
import 'package:homeserve/model/usermodel.dart';
import 'package:homeserve/pages/provider/password.dart';
import 'package:homeserve/pages/user/register.dart';
import 'package:homeserve/themes/themes.dart';

class ProviderRegister extends StatelessWidget {
  const ProviderRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 36, top: 80, right: 36),
            child: Center(
                child: Column(
              children: [
                Text("Sign Up",
                    style: TextStyle(
                        color: Themes.basic,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 60,
                ),
                _Form("Name", textCapitalization: TextCapitalization.words),
                _Form("Phone number"),
                _Form("Email id"),
                _Form("Address"),
                _Form("Service"),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 150),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Password()));
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(130, 45),
                        primary: Themes.basic,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    child: const Text("Next"),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Row(
                    children: [
                      const Text("Not a Service Provider? Sign up as "),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UserRegister()));
                          },
                          child: const Text(
                            "User",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}

Widget _Form(String txt,
    {TextCapitalization textCapitalization = TextCapitalization.none}) {
  return Column(
    children: [
      TextFormField(
        style: const TextStyle(fontSize: 18),
        cursorColor: Colors.black,
        cursorHeight: 24,
        cursorWidth: 1.4,
        textCapitalization: textCapitalization,
        decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            hintText: txt,
            hintStyle: const TextStyle(
                color: Color.fromARGB(255, 170, 163, 163), fontSize: 16)),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return "This field can't be empty.";
          }
          return null;
        },
        onChanged: (val) {
          if (txt == "Email id") {
            User.email = val;
          } else if (txt == "Name") {
            User.name = val;
          } else if (txt == "Phone number") {
            User.phone = val;
          } else if (txt == "Address") {
            User.loc = val;
          } else if (txt == "Service") {
            User.service = val;
          }
        },
      ),
      const SizedBox(
        height: 20,
      )
    ],
  );
}
