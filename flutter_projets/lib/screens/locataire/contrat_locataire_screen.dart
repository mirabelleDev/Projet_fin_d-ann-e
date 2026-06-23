import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContratLocataireScreen extends StatelessWidget {
  const ContratLocataireScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre
            const Text(
              'CONTRAT EN COURS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1C2B3A),
              ),
            ),
            const SizedBox(height: 16),

            // Carte des informations du contrat
            Container(
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
                children: [
                  _buildInfoRow('Bien', 'Résidence Étoile — Appt 3B'),
                  _buildDivider(),
                  _buildInfoRow('Début', '15 janvier 2025'),
                  _buildDivider(),
                  _buildInfoRow('Durée', '12 mois'),
                  _buildDivider(),
                  _buildInfoRow('Loyer mensuel', '150 000 XOF'),
                  _buildDivider(),
                  _buildInfoRow('Caution versée', '300 000 XOF'),
                  _buildDivider(),
                  _buildInfoRow('Gestionnaire', 'M. Agossou KPADÉ'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // CLAUSES PRINCIPALES
            const Text(
              'CLAUSES PRINCIPALES',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1C2B3A),
              ),
            ),
            const SizedBox(height: 12),

            Container(
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
                children: [
                  _buildClauseItem('• Paiement dû avant le 5 de chaque mois'),
                  _buildClauseItem('• Préavis de départ : 2 mois minimum'),
                  _buildClauseItem('• Sous-location interdite sans accord écrit'),
                  _buildClauseItem('• Entretien courant à la charge du locataire'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Bouton Télécharger
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Télécharger le contrat (PDF)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Téléchargement du contrat...'),
                    ),
                  );
                },
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('Télécharger le contrat (PDF)'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1C2B3A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Barre de navigation en bas
      bottomNavigationBar: _buildBottomNavigationBar(context, 1),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF1C2B3A),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[200],
      height: 1,
    );
  }

  Widget _buildClauseItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[800],
          ),
        ),
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
            // Déjà sur le contrat
            break;
          case 2:
            context.go('/locataire/paiements');
            break;
          case 3:
            context.go('/locataire/demandes');
            break;
        }
      },
    );
  }
}