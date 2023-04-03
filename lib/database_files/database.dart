import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'interns_schema.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

part 'database.g.dart';

@DriftDatabase(tables: [InternTable])
class InternDatabase extends _$InternDatabase {
  InternDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Future<int> insertIntern(InternTableCompanion s) async {
  //   return  await into(InternTable as TableInfo<Table, dynamic>).insert(s);
  // }
  //
  // Future<bool> updateIntern(InternTableCompanion intern) async{
  //   return await update(InternTable as TableInfo<Table, dynamic>).replace(intern);
  // }
  //
  // // Future<int> deleteIntern(Intern intern) async {
  // //   return await delete(InternTable as TableInfo<Table, dynamic>).delete(intern);
  // // }
  //
  // Future<int> deleteInternById(int id) async {
  //   return await (delete(internTable)..where((t) => t.id.equals(id))).go();
  // }
  //
  // Stream<List<Intern>> getAllNames() {
  //   return select(internTable).watch();
  // }
  //
  // Future<List<Intern>> getInternDetailsById(int id) {
  //   return (select(internTable)..where((a) => a.id.equals(id))).get();
  // }
  //
  // Future<List<String?>> getListOfNames() async {
  //   final query = selectOnly(internTable);
  //   final result = await query.get();
  //   return result.map((row) => row.read(internTable.name)).toList();
  // }

  //------------------------New----------------

  Future<List<InternTableData>> getAllInterns() async {
    return select(internTable).get();
  }

  // Future<Stream<List<InternTableData>>> getAllInterns() async {
  //   return select(internTable).watch();
  // }
  //
  // Future<InternTableData> getInternsById(int id) async {
  //   return select(internTable)..where((tbl) => tbl.id.equals(id));
  // }

  Future<InternTableData>getInternsById(int id) async {
    return await (select(internTable)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<bool> updateInternById(InternTableCompanion intern) async {
    return await update(internTable).replace(intern);
  }

  Future<int> insertInternDetails(InternTableCompanion intern) async {
    return await into(internTable).insert(intern);
  }

  Future<int> deleteInternById(int id) async {
    return await (delete(internTable)..where((tbl) => tbl.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory(); //internal
    final dbFile = File(join(dbFolder.path, "intern.sqlite"));
    return NativeDatabase(dbFile);
  });
}
