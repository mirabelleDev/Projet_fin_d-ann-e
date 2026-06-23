import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class Proprietes extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get nom => text()();
  TextColumn get adresse => text()();
  TextColumn get description => text()();
  TextColumn get proprietaireId => text()();
  TextColumn get gerantId => text().nullable()();
  IntColumn get archived => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}