import 'package:flutter/material.dart';
import 'package:homeserve/pages/home.dart';
import 'package:homeserve/themes/themes.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 160,
            ),
            Text("Log In",
                style: TextStyle(
                    color: Themes.basic,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 49,
            ),
            textbox("Email id"),
            const SizedBox(
              height: 35,
            ),
            textbox("Password"),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 190),
              child: GestureDetector(
                child: const Text("Forgot Password?"),
              ),
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(306, 50),
                  primary: Themes.basic,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  textStyle: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w500)),
              child: const Text("Log In"),
            ),
            const SizedBox(height: 120),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 85),
              child: Row(
                children: [
                  const Text("Don't have an account?"),
                  GestureDetector(
                      onTap: () {},
                      child: const Text(
                        " Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget textbox(String str) {
  return Container(
    height: 53,
    width: 306,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: const Color(0xff000000)),
    ),
    child: TextField(
      style: const TextStyle(color: Colors.black, fontSize: 18),
      cursorColor: Colors.black,
      cursorHeight: 24,
      cursorWidth: 1.4,
      obscureText: str == "Password",
      decoration: InputDecoration(
          hintText: str,
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 170, 163, 163), fontSize: 16),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 19, horizontal: 15),
          border: InputBorder.none),
    ),
  );
}
