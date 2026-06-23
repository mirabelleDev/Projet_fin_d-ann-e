import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class UnitesLocatives extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get designation => text()();
  TextColumn get type => text()();
  RealColumn get loyerNominal => real()();
  TextColumn get statutOccupation => text()();
  TextColumn get proprieteId => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}