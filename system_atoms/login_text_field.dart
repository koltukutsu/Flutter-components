// necessary
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required this.text,
    required this.controller,
    this.topPadding = 0.0,
    this.hintText,
    this.divider = true,
    this.obscureText = false,
    this.activateWriting = true,
    this.numberOn = false,
  }) : super(key: key);

  final String text;
  final String? hintText;
  final double topPadding;
  final bool divider;
  final bool obscureText;
  final TextEditingController controller;
  final bool activateWriting;
  final bool numberOn;
  @override
  Widget build(BuildContext context) {
    if (divider) {
      return Padding(
        // userName Widget
        padding: EdgeInsets.only(top: topPadding),
        child: SizedBox(
            width: 280,
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Column(
                        children: [
                          TextField(
                            enabled: activateWriting,
                            obscureText: obscureText,
                            controller: controller,
                            keyboardType: numberOn ? TextInputType.number: TextInputType.text,
                            decoration: InputDecoration(
                                labelStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                )),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 1),
                                ),
                                labelText: text,
                                hintText: hintText),
                          ),
                          const Divider(
                            indent: 10,
                            endIndent: 10,
                            height: 30,
                            thickness: 2,
                            color: Colors.black,
                          ),
                        ],
                      ))
                ]))),
      );
    } else {
      return Padding(
        // userName Widget
        padding: EdgeInsets.only(top: topPadding),
        child: SizedBox(
            width: 280,
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Column(
                        children: [
                          TextField(
                            enabled: activateWriting,
                            obscureText: obscureText,
                            controller: controller,
                            keyboardType: numberOn ? TextInputType.number: TextInputType.text,
                            decoration: InputDecoration(
                                labelStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                )),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 1),
                                ),
                                labelText: text,
                                hintText: hintText),
                          ),
                        ],
                      ))
                ]))),
      );
    }
  }
}
