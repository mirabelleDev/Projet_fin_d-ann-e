import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DemandesLocataireScreen extends StatelessWidget {
  const DemandesLocataireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final demandes = [
      {
        'titre': 'Fuite d\'eau — salle de bain',
        'date': '28 mai 2026',
        'statut': 'Résolu',
        'couleur': Colors.green,
      },
      {
        'titre': 'Problème électrique — prise cuisine',
        'date': '10 avril 2026',
        'statut': 'En cours',
        'couleur': Colors.orange,
      },
      {
        'titre': 'Peinture couloir écaillée',
        'date': '2 mars 2026',
        'statut': 'Résolu',
        'couleur': Colors.green,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'GESTILOYER',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color(0xFF1C2B3A),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              context.go('/locataire/nouvelle-demande');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'MES DEMANDES',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1C2B3A),
              ),
            ),
            const SizedBox(height: 16),

            // Liste des demandes
            ...demandes.map((demande) => _buildDemandeCard(demande)),
          ],
        ),
      ),

      bottomNavigationBar: _buildBottomNavigationBar(context, 3),
    );
  }

  Widget _buildDemandeCard(Map<String, dynamic> demande) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            demande['titre'],
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF1C2B3A),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                demande['date'],
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: demande['couleur'].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  demande['statut'],
                  style: TextStyle(
                    color: demande['couleur'],
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, int currentIndex) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF1C2B3A),
      unselectedItemColor: Colors.grey[600],
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
        BottomNavigationBarItem(icon: Icon(Icons.description_outlined), label: 'Contrat'),
        BottomNavigationBarItem(icon: Icon(Icons.payments_outlined), label: 'Paiements'),
        BottomNavigationBarItem(icon: Icon(Icons.build_outlined), label: 'Demandes'),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            context.go('/locataire/dashboard');
            break;
          case 1:
            context.go('/locataire/contrat');
            break;
          case 2:
            context.go('/locataire/paiements');
            break;
          case 3:
            // Déjà sur les demandes
            break;
        }
      },
    );
  }
}