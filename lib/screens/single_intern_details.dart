import 'package:flutter/material.dart';
import 'package:project_2_assignment/database_files/database.dart';
import 'package:project_2_assignment/helping_widgets/appbar.dart';

class InternDetailPage extends StatefulWidget {
  final int id;
  const InternDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<InternDetailPage> createState() => _InternDetailPageState();
}

class _InternDetailPageState extends State<InternDetailPage> {
  // declare variables
  late Future<InternTableData?> _futureInternData;
  late InternDatabase _internDatabase;

  @override
  void initState() {
    // initialize database and fetch intern data by id
    _internDatabase = InternDatabase();
    _futureInternData = _internDatabase.getInternsById(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("Intern Detail Page"), // custom appbar widget
      body: FutureBuilder<InternTableData?>(
        future: _futureInternData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Some error occurred",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final internData = snapshot.data;

          if (internData != null) {
            // display intern data in cards
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Card(
                    child: Text(internData.name),
                  ),
                  Card(
                    child: Text(internData.age),
                  ),
                  Card(
                    child: Text(internData.number),
                  ),
                  Card(
                    child: Text(internData.designation),
                  ),
                  Card(
                    child: Text(internData.domain),
                  ),
                ],
              ),
            );
          }

          // if no data found
          return const Center(
            child: Text('No Data Found.'),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _internDatabase.close(); // close the database when page is disposed
    super.dispose();
  }
}