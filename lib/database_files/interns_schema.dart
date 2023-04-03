import 'package:drift/drift.dart';

class InternTable extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 5,max: 20)();
  TextColumn get number => text()();
  TextColumn get designation => text()();
  TextColumn get age => text()();
  TextColumn get domain => text()();

}