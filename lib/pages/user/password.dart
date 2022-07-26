import 'package:flutter/material.dart';
import 'package:homeserve/pages/user/home.dart';
import 'package:homeserve/pages/user/register.dart';
import 'package:homeserve/services/auth.dart';
import 'package:homeserve/themes/themes.dart';

class Password extends StatelessWidget {
  Password({Key? key}) : super(key: key);

  Auth auth = Auth();

  String password = "";
  String confirmpwd = "";
  String email = UserRegister.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white38,
        elevation: 0,
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
                size: 22,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            const Text("Set up a password for your",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
            const SizedBox(height: 5),
            const Text("account",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 49,
            ),
            Textbox("Create Password"),
            const SizedBox(
              height: 35,
            ),
            Textbox("Confirm Password"),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: ElevatedButton(
                onPressed: () async {
                  if (password == confirmpwd) {
                    dynamic result = await auth.register(email, password);
                    if (result == null)
                      print("Error signing up!");
                    else {
                      print(result);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserHome(
                                    name: UserRegister.name,
                                  )));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(130, 45),
                    primary: Themes.basic,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500)),
                child: const Text("Sign Up"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Textbox(String str) {
    return Container(
      height: 53,
      width: 306,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xff000000)),
      ),
      child: TextField(
        style: const TextStyle(fontSize: 18),
        cursorColor: Colors.black,
        cursorHeight: 24,
        cursorWidth: 1.4,
        obscureText: true,
        decoration: InputDecoration(
            hintText: str,
            hintStyle: const TextStyle(
                color: Color.fromARGB(255, 170, 163, 163), fontSize: 16),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 19, horizontal: 15),
            border: InputBorder.none),
        onChanged: (pwd) {
          if (str == "Confirm Password") confirmpwd = pwd;
          if (str == "Create Password") password = pwd;
        },
      ),
    );
  }
}