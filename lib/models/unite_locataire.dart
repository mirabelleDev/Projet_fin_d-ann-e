class UniteLocative {
  final String id;
  final String designation;
  final String type; // Appartement, Chambre, Boutique, Bureau
  final double loyerNominal;
  final String statutOccupation; // disponible, occupe, en_travaux
  final String proprieteId;
  final DateTime createdAt;
  final DateTime updatedAt;

  UniteLocative({
    required this.id,
    required this.designation,
    required this.type,
    required this.loyerNominal,
    required this.statutOccupation,
    required this.proprieteId,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'designation': designation,
    'type': type,
    'loyerNominal': loyerNominal,
    'statutOccupation': statutOccupation,
    'proprieteId': proprieteId,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory UniteLocative.fromMap(Map<String, dynamic> map) => UniteLocative(
    id: map['id'],
    designation: map['designation'],
    type: map['type'],
    loyerNominal: map['loyerNominal'],
    statutOccupation: map['statutOccupation'],
    proprieteId: map['proprieteId'],
    createdAt: DateTime.parse(map['createdAt']),
    updatedAt: DateTime.parse(map['updatedAt']),
  );
}