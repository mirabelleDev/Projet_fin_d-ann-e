import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/auth/auth_cubit.dart';
import '../../models/user.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final selectedRole = (context.read<AuthCubit>().state as AuthInitial?)?.selectedRole;

    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion ${selectedRole?.name ?? ''}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(), // ⬅️ Utilisation de go_router pour revenir en arrière
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              // Redirection vers le bon dashboard
              _navigateToDashboard(context, state.user.role);
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text(
                  'Connectez-vous à votre espace',
                  style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
                const SizedBox(height: 32),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      final email = _emailController.text.trim();
                      final password = _passwordController.text.trim();
                      if (email.isNotEmpty && password.isNotEmpty) {
                        // ⬅️ Appel du Cubit pour la connexion
                        context.read<AuthCubit>().login(email, password);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Veuillez remplir tous les champs')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Se connecter'),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    // ⬅️ Navigation vers l'inscription
                    context.pushNamed('register');
                  },
                  child: const Text("Pas encore de compte ? S'inscrire"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _navigateToDashboard(BuildContext context, Role role) {
    String route;
    if (role == Role.locataire) {
      route = '/locataire/dashboard';
    } else if (role == Role.gerant) {
      route = '/gerant/dashboard';
    } else {
      route = '/proprietaire/dashboard';
    }
    context.go(route); // ⬅️ Remplace l'écran actuel par le dashboard
  }
}