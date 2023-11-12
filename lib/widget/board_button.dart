import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
   Function onBtnClick;
   String textButton;
   int position;
   int counterButton;
   Color colorText;
   double fontSize;
   bool enabledButton;
   bool selectedButton;
   BoardButton(
      {super.key,
        required this.counterButton,
      required this.colorText,
      required this.textButton,

      required this.onBtnClick,
      required this.position,
      required this.fontSize,
      this.enabledButton = true,this.selectedButton = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 3, right: 3, bottom: 3),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.all(0),
          ),
        ),
        onPressed: enabledButton == true
            ? () {
                onBtnClick(position);
              }
            : null,
        child: Stack(
          children: [
            Text(
              textButton,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: 'XO2',
                fontWeight: FontWeight.w600,
                color: textButton == 'X'
                    ? const Color(0xff0075fb)
                    : const Color(0xfffc0e85),
                shadows: [
                  Shadow(
                    color: textButton == 'X'
                        ? const Color(0xff0075fb)
                        : const Color(0xfffc0e85), //color shadow,
                    blurRadius: 20,
                    offset: const Offset(1.0, 3.0),
                  ),
                ],
              ),
            ),
            Text(
              textButton,
              style: TextStyle(
                  fontSize: fontSize - 1,
                  fontFamily: 'XO2',
                  color: selectedButton == false?Colors.black:textButton == 'X'? const Color(0xff0075fb)
                      : const Color(0xfffc0e85)),
            ),
          ],
        ),
      ),
    ));
  }
}
