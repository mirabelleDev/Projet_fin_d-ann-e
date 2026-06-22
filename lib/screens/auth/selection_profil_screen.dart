import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth/auth_cubit.dart';
import '../../models/user.dart';

class SelectionProfilScreen extends StatelessWidget {
  const SelectionProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'GESTILOYER',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Qui êtes-vous ?',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            Text(
              'Sélectionnez votre profil pour accéder à votre espace personnel.',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 40),
            _buildProfilCard(
              context,
              icon: Icons.person_outline,
              title: 'Locataire',
              subtitle: 'Consulter mon contrat, mes paiements et faire des demandes',
              role: Role.locataire,
            ),
            const SizedBox(height: 16),
            _buildProfilCard(
              context,
              icon: Icons.business_center_outlined,
              title: 'Gérant',
              subtitle: 'Gérer les biens, encaisser les loyers et suivre les locataires',
              role: Role.gerant,
            ),
            const SizedBox(height: 16),
            _buildProfilCard(
              context,
              icon: Icons.house_outlined,
              title: 'Propriétaire',
              subtitle: 'Suivre les revenus, les biens et les performances',
              role: Role.proprietaire,
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                'Gestion Locative · Bénin / UEMOA',
                style: TextStyle(color: Colors.grey[500], fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required Role role}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Sauvegarder le rôle sélectionné et naviguer vers l'écran de connexion
          context.read<AuthCubit>().selectRole(role);
          Navigator.pushNamed(context, '/login');
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: Icon(icon, color: Colors.blue[800]),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}