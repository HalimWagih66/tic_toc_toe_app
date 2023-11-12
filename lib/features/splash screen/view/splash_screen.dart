import 'dart:async';

import 'package:flutter/material.dart';

import '../../input_information_users/view/input_information_users_view.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer( const Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacementNamed(InputInformationUsersView.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome",
                style: TextStyle(
                    color: Color(0xfff7017f),
                    fontSize: 68,
                    fontFamily: 'XO',
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 30,
            ),
            Text("to",
                style: TextStyle(
                    color: Color(0xfff7017f),
                    fontSize: 68,
                    fontFamily: 'XO',
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 30,
            ),
            Text(
              "the game",
              style: TextStyle(
                  color: Color(0xff7b56c7),
                  fontSize: 68,
                  fontFamily: 'XO',
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Tic Tok Toe",
              style: TextStyle(
                  color: Color(0xff0371fc),
                  fontSize: 68,
                  fontFamily: 'XO',
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
