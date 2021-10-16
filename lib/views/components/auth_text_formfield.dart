import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  // final TextEditingController controller;
  final hint;
  final prefixIcon;
  final obscureText;
  const AuthTextFormField({
    Key? key,
    this.hint,
    this.prefixIcon,
    this.obscureText,
    // required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 5, bottom: 1),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.grey,
            ),
            hintText: hint,
            focusedBorder: new UnderlineInputBorder(
                borderSide: new BorderSide(color: Colors.grey)),
            enabledBorder: UnderlineInputBorder(
                borderSide: new BorderSide(color: Colors.grey.shade300))),
      ),
    );
  }
}
