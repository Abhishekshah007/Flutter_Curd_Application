
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';

import '../database_files/database.dart';
import 'appbar.dart';



class UpdatingInternDetails extends StatefulWidget {
  final id;
  const UpdatingInternDetails({super.key, required this.id});

  @override
  State<StatefulWidget> createState() {
    return UpdatingInternDetailsState();
  }
}

class UpdatingInternDetailsState extends State<UpdatingInternDetails> {
  late InternDatabase _internDatabase;
  late InternTableData _internTableData;



  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController domainController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _internDatabase = InternDatabase();
    getInternValue();
  }

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
        title: "Add and Update employee",
      home: Scaffold(
        appBar: MyAppBar("Updating Intern Details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: numberController,
                decoration: const InputDecoration(
                  labelText: 'Number',
                ),
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
              ),
              TextField(
                controller: designationController,
                decoration: const InputDecoration(
                  labelText: 'Designation',
                ),
              ),
              TextField(
                controller: domainController,
                decoration: const InputDecoration(
                  labelText: 'Domain',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {

                  final SchemaData = InternTableCompanion(
                    id: drift.Value(widget.id),
                    name: drift.Value(nameController.text),
                    age: drift.Value(ageController.text),
                    number: drift.Value(numberController.text),
                    designation: drift.Value(designationController.text),
                    domain: drift.Value(domainController.text),
                  );
                  _internDatabase.updateInternById(SchemaData);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data Updated successfully',style: TextStyle(backgroundColor: Colors.orangeAccent,fontWeight: FontWeight.bold),)),
                  );



                },
                child: const Text('Click to Update'),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }

  Future<void> getInternValue() async{
    _internTableData = await _internDatabase.getInternsById(widget.id);
    nameController.text = _internTableData.name;
    numberController.text = _internTableData.number;
    designationController.text = _internTableData.designation;
    domainController.text = _internTableData.domain;
    ageController.text= (_internTableData.age) ;
  }





  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    nameController.dispose();
    domainController.dispose();
    designationController.dispose();
    _internDatabase.close();
    super.dispose();
  }
}