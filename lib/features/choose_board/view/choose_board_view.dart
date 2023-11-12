import 'package:flutter/material.dart';

import '../../board_screen/view/board_view.dart';

class ChooseBoardView extends StatelessWidget {
    const ChooseBoardView({super.key});
  static const routeName = "Choose_board";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          color: Color(0xff1a1d50)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: .15,
              child: Container(
                //width: double.infinity,
                height: 77,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color: const Color(0xb0f7017f),
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black54,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BoardView(counterButton: 3),
                      ),
                    );
                  },
                  child: const Text(
                    "3      X      3",
                    style: TextStyle(
                        color: Color(0xbbf7017f),
                        fontSize: 45,
                        fontFamily: 'XO2'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 77,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: const Color(0xff9b81d2),
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(25),
                color: Colors.black54,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BoardView(counterButton: 6),
                  ));
                },
                child: const Text(
                  "6      X      6",
                  style: TextStyle(
                      color: Color(0xff9b81d2),
                      fontSize: 45,
                      fontFamily: 'XO2'),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Transform.rotate(
              angle: 0.15,
              child: Container(
                height: 77,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color: const Color(0xbd0371fc),
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black54,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BoardView(counterButton: 9),
                    ));
                  },
                  child: const Text(
                    "9      X      9",
                    style: TextStyle(
                        color: Color(0xbb0371fc),
                        fontSize: 45,
                        fontFamily: 'XO2'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
