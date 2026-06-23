import '../models/user.dart';

class AuthRepository {
  // Simule une API : vérifie les identifiants
  Future<User?> login(String email, String password) async {
    await Future.delayed(Duration(milliseconds: 500)); // simule un délai réseau
    final users = User.mockUsers();
    try {
      return users.firstWhere((u) => u.email == email && u.password == password);
    } catch (e) {
      return null;
    }
  }

  // Simule une inscription (crée un nouvel utilisateur)
  Future<User?> register(String nom, String email, String password, Role role) async {
    await Future.delayed(Duration(milliseconds: 500));
    // Dans la vraie vie, on enverrait au serveur. Ici on crée un user fictif.
    return User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      nom: nom,
      email: email,
      password: password,
      role: role,
    );
  }
}