import 'package:flutter/material.dart';

Widget buildTextField(String label, String prefix, TextEditingController c, Function f){
  return TextField(
    controller: c,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            color: Colors.green
        ),
        border: OutlineInputBorder(),
        prefixText:  prefix,
        suffixStyle: TextStyle(
            color: Colors.green
        )
    ),
    onChanged: f,
  );
}