import 'package:flutter/material.dart';


class CustomFormField extends StatelessWidget {
  const CustomFormField({super.key, required this.textEditingController, required this.labelText, required this.prefixText, required this.prefixTextColor, required this.textInputAction});
  final TextEditingController textEditingController;
  final String labelText;
  final String prefixText;
  final Color prefixTextColor;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction:textInputAction ,
      controller: textEditingController,
      style: const TextStyle(color: Color(0xdb06d2f7),fontFamily: "XO2",fontSize:20),
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        focusColor: Colors.black,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1,color: Color(0xff2f2f72),style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(prefixText,style: TextStyle(color:prefixTextColor, fontFamily: "SeymourOne",fontSize: 30,fontWeight: FontWeight.w900),textAlign: TextAlign.center,),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          fontFamily: "XO2",
            fontSize: 22,
            color: Color(0xc72596be)
        ),
        filled: true,
        fillColor: const Color(0xff101032),
      )
    );
  }
}
