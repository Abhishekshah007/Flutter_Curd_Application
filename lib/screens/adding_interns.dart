import 'package:flutter/material.dart';
import 'package:project_2_assignment/helping_widgets/appbar.dart';

import '../database_files/database.dart';

class AddingUpdatingScreen extends StatelessWidget {
  const AddingUpdatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Add and Update employee",
      home: Scaffold(
        appBar: MyAppBar("Adding Intern"),
        body: const InputInternDetails(),
      ),
    );
  }
}

class InputInternDetails extends StatefulWidget {
  const InputInternDetails({super.key});

  @override
  State<StatefulWidget> createState() {
    return InputInternDetailsState();
  }
}

class InputInternDetailsState extends State<InputInternDetails> {
  late InternDatabase _internDatabase;

  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _number;
  late String _age;
  late String _designation;
  late String _domain;

  @override
  void initState() {
    super.initState();
    _internDatabase = InternDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _number = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an age';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _age = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Designation'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a designation';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _designation = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Domain'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a domain';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _domain = value!;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child:
                          const Text('Submit', style: TextStyle(fontSize: 22)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      //
      // // do something with the form values
      // if (kDebugMode) {
      //   print('Name: $_name');
      // }
      // if (kDebugMode) {
      //   print('Number: $_number');
      // }
      // if (kDebugMode) {
      //   print('Age: $_age');
      // }
      // if (kDebugMode) {
      //   print('Designation: $_designation');
      // }
      // if (kDebugMode) {
      //   print('Domain: $_domain');
      // }

      final schemaData = InternTableCompanion.insert(
        name: _name,
        age: _age,
        number: _number,
        designation: _designation,
        domain: _domain,
      );

      _internDatabase.insertInternDetails(schemaData);

      // Create a new User object with the entered data
      // final user = User(
      //   name: _name!,
      //   number: _number!,
      //   gender: _designation!,
      //   id: 0,
      //   designation: _designation!,
      //   domain: _domain!,
      // );

      // Navigate back to the previous screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data saved successfully',style: TextStyle(backgroundColor: Colors.green,fontWeight: FontWeight.bold)),
        ));

      _formKey.currentState!.reset();
    }
  }

  @override
  void dispose() {
    _internDatabase.close();
    super.dispose();
  }
}
