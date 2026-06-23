class ContratBail {
  final String id;
  final String uniteId;
  final String locataireId;
  final DateTime dateDebut;
  final DateTime dateFin;
  final double loyerNegocie;
  final double caution;
  final double avance;
  final String statut; // actif, suspendu, resilie
  final DateTime createdAt;
  final DateTime updatedAt;

  ContratBail({
    required this.id,
    required this.uniteId,
    required this.locataireId,
    required this.dateDebut,
    required this.dateFin,
    required this.loyerNegocie,
    required this.caution,
    required this.avance,
    required this.statut,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'uniteId': uniteId,
    'locataireId': locataireId,
    'dateDebut': dateDebut.toIso8601String(),
    'dateFin': dateFin.toIso8601String(),
    'loyerNegocie': loyerNegocie,
    'caution': caution,
    'avance': avance,
    'statut': statut,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory ContratBail.fromMap(Map<String, dynamic> map) => ContratBail(
    id: map['id'],
    uniteId: map['uniteId'],
    locataireId: map['locataireId'],
    dateDebut: DateTime.parse(map['dateDebut']),
    dateFin: DateTime.parse(map['dateFin']),
    loyerNegocie: map['loyerNegocie'],
    caution: map['caution'],
    avance: map['avance'],
    statut: map['statut'],
    createdAt: DateTime.parse(map['createdAt']),
    updatedAt: DateTime.parse(map['updatedAt']),
  );
}