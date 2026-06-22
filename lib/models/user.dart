enum Role { gerant, proprietaire, locataire }

class User {
  final String id;
  final String nom;
  final String email;
  final String telephone;
  final Role role;

  User({
    required this.id,
    required this.nom,
    required this.email,
    required this.telephone,
    required this.role,
  });

  // Pour simuler l'API (Mock)
  factory User.mockGerant() => User(
    id: 'uuid-001',
    nom: 'Jean Dupont',
    email: 'jean@gerant.com',
    telephone: '+229 90000000',
    role: Role.gerant,
  );

  factory User.mockProprietaire() => User(
    id: 'uuid-002',
    nom: 'Aïcha Diallo',
    email: 'aicha@proprio.com',
    telephone: '+229 91111111',
    role: Role.proprietaire,
  );

  factory User.mockLocataire() => User(
    id: 'uuid-003',
    nom: 'Ali Traoré',
    email: 'ali@locataire.com',
    telephone: '+229 92222222',
    role: Role.locataire,
  );

  // Conversion JSON
  Map<String, dynamic> toJson() => {
    'id': id,
    'nom': nom,
    'email': email,
    'telephone': telephone,
    'role': role.name,
  };

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    nom: json['nom'],
    email: json['email'],
    telephone: json['telephone'],
    role: Role.values.firstWhere((e) => e.name == json['role']),
  );
}