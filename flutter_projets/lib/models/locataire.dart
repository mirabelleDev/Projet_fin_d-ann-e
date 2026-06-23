class Locataire {
  final String id;
  final String nom;
  final String telephone;
  final String email;
  final String contactUrgence;
  final String? pieceIdentite;
  final String? userId; // Lien vers le compte User (optionnel)
  final DateTime createdAt;
  final DateTime updatedAt;

  Locataire({
    required this.id,
    required this.nom,
    required this.telephone,
    required this.email,
    required this.contactUrgence,
    this.pieceIdentite,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'nom': nom,
    'telephone': telephone,
    'email': email,
    'contactUrgence': contactUrgence,
    'pieceIdentite': pieceIdentite,
    'userId': userId,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory Locataire.fromMap(Map<String, dynamic> map) => Locataire(
    id: map['id'],
    nom: map['nom'],
    telephone: map['telephone'],
    email: map['email'],
    contactUrgence: map['contactUrgence'],
    pieceIdentite: map['pieceIdentite'],
    userId: map['userId'],
    createdAt: DateTime.parse(map['createdAt']),
    updatedAt: DateTime.parse(map['updatedAt']),
  );
}