// Importing required libraries and widgets
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_2_assignment/helping_widgets/appbar.dart';
import 'package:project_2_assignment/helping_widgets/floating_button.dart';
import 'package:project_2_assignment/screens/interns_list.dart';

// Entry point of the application
void main() {
  // Running the application
  runApp(const MyApp());
}

// Defining the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Building the UI of the application
    return MaterialApp(
      title: "Intern Details",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Adding a custom app bar
        appBar: MyAppBar("Intern List"),
        // Adding the list of interns
        body: const InternList(),
        // Adding a custom floating action button
        floatingActionButton: AddingButton(
          onPressed: () {
            // Checking if the application is in debug mode
            if (kDebugMode) {
              // Printing a message to the console
              print("Button pressed");
            }
          },
        ),
      ),
    );
  }
}
