import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_2_assignment/screens/adding_interns.dart';

class AddingButton extends FloatingActionButton {
  const AddingButton({super.key, required super.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (kDebugMode) {
          print("Add Intern");
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddingUpdatingScreen()),
        );
      },
      backgroundColor: Colors.green,
      tooltip: "Add Intern",
      child: const Icon(Icons.add),
    );
  }
}
