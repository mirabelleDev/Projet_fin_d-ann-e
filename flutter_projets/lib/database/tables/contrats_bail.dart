import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class ContratsBail extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get uniteId => text()();
  TextColumn get locataireId => text()();
  DateTimeColumn get dateDebut => dateTime()();
  DateTimeColumn get dateFin => dateTime()();
  RealColumn get loyerNegocie => real()();
  RealColumn get caution => real()();
  RealColumn get avance => real()();
  TextColumn get statut => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}