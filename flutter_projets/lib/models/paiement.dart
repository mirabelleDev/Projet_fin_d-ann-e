enum StatutPaiement { en_attente, valide, annule }

class Paiement {
  final String id;
  final String contratId;
  final double montant;
  final String periode; // "MM/YYYY"
  final String modeReglement; // Especes, MobileMoney, Virement, Cheque
  final StatutPaiement statut;
  final String enregistrePar; // ID de l'utilisateur qui a saisi
  final String? validePar; // ID du gérant qui a validé
  final DateTime datePaiement;
  final String? commentaire;
  final DateTime createdAt;
  final DateTime updatedAt;

  Paiement({
    required this.id,
    required this.contratId,
    required this.montant,
    required this.periode,
    required this.modeReglement,
    required this.statut,
    required this.enregistrePar,
    this.validePar,
    required this.datePaiement,
    this.commentaire,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'contratId': contratId,
    'montant': montant,
    'periode': periode,
    'modeReglement': modeReglement,
    'statut': statut.name,
    'enregistrePar': enregistrePar,
    'validePar': validePar,
    'datePaiement': datePaiement.toIso8601String(),
    'commentaire': commentaire,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory Paiement.fromMap(Map<String, dynamic> map) => Paiement(
    id: map['id'],
    contratId: map['contratId'],
    montant: map['montant'],
    periode: map['periode'],
    modeReglement: map['modeReglement'],
    statut: StatutPaiement.values.firstWhere((e) => e.name == map['statut']),
    enregistrePar: map['enregistrePar'],
    validePar: map['validePar'],
    datePaiement: DateTime.parse(map['datePaiement']),
    commentaire: map['commentaire'],
    createdAt: DateTime.parse(map['createdAt']),
    updatedAt: DateTime.parse(map['updatedAt']),
  );
}