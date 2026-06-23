import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class Paiements extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get contratId => text()();
  RealColumn get montant => real()();
  TextColumn get periode => text()();
  TextColumn get modeReglement => text()();
  TextColumn get statut => text()();
  TextColumn get enregistrePar => text()();
  TextColumn get validePar => text().nullable()();
  DateTimeColumn get datePaiement => dateTime()();
  TextColumn get commentaire => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}