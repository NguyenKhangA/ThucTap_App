import 'package:flutter/material.dart';

Widget buildTextForm(
    String lable, Icon icon, TextEditingController textcontroller) {
  return TextFormField(
    controller: textcontroller,
    obscureText: true,
    decoration: InputDecoration(
      prefixIcon: icon,
      labelText: lable,
      border: const OutlineInputBorder(),
    ),
  );
}
