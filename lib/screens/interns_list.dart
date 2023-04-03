import 'package:flutter/material.dart';
import 'package:project_2_assignment/database_files/database.dart';
import 'package:project_2_assignment/helping_widgets/updating_intern_details.dart';
import 'package:project_2_assignment/screens/single_intern_details.dart';

class InternList extends StatefulWidget {
  const InternList({Key? key}) : super(key: key);

  @override
  State<InternList> createState() => _InternListState();
}

class _InternListState extends State<InternList> {
  // Initialize database and future object for interns
  late InternDatabase _internDatabase;
  late Future<List<InternTableData>> _internsFuture;

  @override
  void initState() {
    // Initialize database and fetch all interns from database
    _internDatabase = InternDatabase();
    _internsFuture = _internDatabase.getAllInterns();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      // Add a refresh indicator to refresh the list view
      onRefresh: _refreshInterns,
      child: FutureBuilder<List<InternTableData>>(
        future: _internsFuture,
        builder: (context, snapshot) {
          final List<InternTableData>? interns = snapshot.data;

          if (snapshot.hasError) {
            // Display error message if there's an error in fetching data from database
            return const Center(
              child: Text(
                "Some error occurred",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            );
          }

          if (interns != null) {
            // Build the list view with intern data fetched from database
            return Scaffold(
              body: ListView.builder(
                itemCount: interns.length,
                itemBuilder: (context, index) {
                  final internName = interns[index];
                  return Dismissible(
                    key: Key(internName.id.toString()),
                    direction: DismissDirection.horizontal,
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        // Handle editing by opening a new page with form fields to update data
                        _deleteItem(internName.id);
                      } else if (direction == DismissDirection.startToEnd) {
                        // Handle deleting by deleting data from database and showing a snackbar message
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UpdatingInternDetails(id: internName.id)));
                        setState(() {});
                      }
                    },
                    background: Container(
                      color: Colors.orangeAccent,
                      alignment: Alignment.centerLeft,
                      child: const Icon(Icons.edit),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: const Icon(Icons.delete),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to single intern details page on tapping the intern card
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                InternDetailPage(id: internName.id),
                          ),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                              internName.name.toString(),
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.blueGrey)),
                          subtitle:
                          Text(internName.designation.toString()),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }

          if (snapshot.connectionState != ConnectionState.done) {
            // Display a loading indicator if the data is still being fetched from database
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // If there are no interns in the database, display a message
          return const Center(
            child: Text('Looks Like List is Empty.'),
          );
        },
      ),
    );
  }

  Future<void> _refreshInterns() async {
    setState(() {
      _internsFuture = _internDatabase.getAllInterns();
    });
  }

  void _deleteItem(int id) {
    _internDatabase.deleteInternById(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Data Delete successfully',
            style: TextStyle(backgroundColor: Colors.red,fontWeight: FontWeight.bold),)),
    );
  }

  @override
  void dispose() {
    _internDatabase.close();
    super.dispose();
  }
}