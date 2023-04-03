import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar(String? title, {super.key})
      : super(
          backgroundColor: Colors.deepOrangeAccent,
          title: title != null
              ? Text(title,
                  style: const TextStyle(color: Colors.black, fontSize: 20))
              : null,
        );
}
