enum Role { locataire, gerant, proprietaire }

class User {
  final String id;
  final String nom;
  final String email;
  final String password; // hashé en vrai, mais pour mock on garde en clair
  final Role role;

  User({required this.id, required this.nom, required this.email, required this.password, required this.role});

  Map<String, dynamic> toJson() => {
    'id': id,
    'nom': nom,
    'email': email,
    'password': password,
    'role': role.name,
  };

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    nom: json['nom'],
    email: json['email'],
    password: json['password'],
    role: Role.values.firstWhere((e) => e.name == json['role']),
  );

  // Mock utilisateurs pré-remplis (pour test)
  static List<User> mockUsers() => [
    User(id: '1', nom: 'Locataire Test', email: 'locataire@test.com', password: '1234', role: Role.locataire),
    User(id: '2', nom: 'Gérant Test', email: 'gerant@test.com', password: '1234', role: Role.gerant),
    User(id: '3', nom: 'Propriétaire Test', email: 'proprio@test.com', password: '1234', role: Role.proprietaire),
  ];
}