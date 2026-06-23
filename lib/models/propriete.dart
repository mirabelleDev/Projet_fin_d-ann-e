class Propriete {
  final String id;
  final String nom;
  final String adresse;
  final String description;
  final String proprietaireId; // ID du propriétaire (User)
  final String? gerantId; // ID du gérant (User) - optionnel
  final bool archived;
  final DateTime createdAt;
  final DateTime updatedAt;

  Propriete({
    required this.id,
    required this.nom,
    required this.adresse,
    required this.description,
    required this.proprietaireId,
    this.gerantId,
    this.archived = false,
    required this.createdAt,
    required this.updatedAt,
  });

  // Conversion en Map pour la base de données
  Map<String, dynamic> toMap() => {
    'id': id,
    'nom': nom,
    'adresse': adresse,
    'description': description,
    'proprietaireId': proprietaireId,
    'gerantId': gerantId,
    'archived': archived ? 1 : 0,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory Propriete.fromMap(Map<String, dynamic> map) => Propriete(
    id: map['id'],
    nom: map['nom'],
    adresse: map['adresse'],
    description: map['description'],
    proprietaireId: map['proprietaireId'],
    gerantId: map['gerantId'],
    archived: map['archived'] == 1,
    createdAt: DateTime.parse(map['createdAt']),
    updatedAt: DateTime.parse(map['updatedAt']),
  );
}