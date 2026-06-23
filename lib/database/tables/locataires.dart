import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class Locataires extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get nom => text()();
  TextColumn get telephone => text()();
  TextColumn get email => text()();
  TextColumn get contactUrgence => text()();
  TextColumn get pieceIdentite => text().nullable()();
  TextColumn get userId => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}