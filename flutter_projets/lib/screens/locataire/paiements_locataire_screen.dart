import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaiementsLocataireScreen extends StatelessWidget {
  const PaiementsLocataireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Données mockées
    final paiements = [
      {'mois': 'Mai 2026', 'mode': 'Mobile Money', 'montant': '150 000 XOF'},
      {'mois': 'Avril 2026', 'mode': 'Espèces', 'montant': '75 000 XOF'},
      {'mois': 'Mars 2026', 'mode': 'Virement', 'montant': '150 000 XOF'},
      {'mois': 'Février 2026', 'mode': 'Espèces', 'montant': '150 000 XOF'},
      {'mois': 'Janvier 2026', 'mode': 'Mobile Money', 'montant': '150 000 XOF'},
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Locataire',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                // Badge solde
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red[200]!),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '-75 000 XOF',
                        style: TextStyle(
                          color: Colors.red[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Loyer mensuel
            Row(
              children: [
                const Text(
                  'Loyer mensuel',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '150 000 XOF',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1C2B3A),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Titre Historique
            const Text(
              'HISTORIQUE',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1C2B3A),
              ),
            ),
            const SizedBox(height: 12),

            // Liste des paiements
            Container(
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
                children: paiements.map((paiement) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              paiement['mois']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFF1C2B3A),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              paiement['mode']!,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          paiement['montant']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF1C2B3A),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),

      // Barre de navigation
      bottomNavigationBar: _buildBottomNavigationBar(context, 2),
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
            // Déjà sur les paiements
            break;
          case 3:
            context.go('/locataire/demandes');
            break;
        }
      },
    );
  }
}