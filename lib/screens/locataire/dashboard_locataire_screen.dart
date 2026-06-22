import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardLocataireScreen extends StatelessWidget {
  const DashboardLocataireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'GESTILOYER',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[800],
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {
              // Déconnexion
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== EN-TÊTE LOCATAIRE =====
            const Text(
              'Locataire',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),

            // ===== CARTE SOLDE ACTUEL =====
            _buildSoldeCard(),
            const SizedBox(height: 16),

            // ===== ROW LOYER MENSUEL + PROCHAIN PAIEMENT =====
            Row(
              children: [
                Expanded(child: _buildLoyerMensuelCard()),
                const SizedBox(width: 12),
                Expanded(child: _buildProchainPaiementCard()),
              ],
            ),
            const SizedBox(height: 24),

            // ===== SECTION ACTIONS =====
            const Text(
              'ACTIONS',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12),
            _buildActionsGrid(),
            const SizedBox(height: 24),

            // ===== DERNIERS PAIEMENTS =====
            const Text(
              'DERNIERS PAIEMENTS',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12),
            _buildDerniersPaiements(),
            const SizedBox(height: 16),
          ],
        ),
      ),
      // ===== BARRE DE NAVIGATION EN BAS =====
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  // ==========================================
  // CARTE SOLDE ACTUEL
  // ==========================================
  Widget _buildSoldeCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SOLDE ACTUEL',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                '-75 000 XOF',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '1 mois en retard',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            '— Mai 2026',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // CARTE LOYER MENSUEL
  // ==========================================
  Widget _buildLoyerMensuelCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Loyer mensuel',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '150 000 XOF',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // CARTE PROCHAIN PAIEMENT
  // ==========================================
  Widget _buildProchainPaiementCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Prochain paiement',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '15 Juillet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // GRILLE DES ACTIONS
  // ==========================================
  Widget _buildActionsGrid() {
    return Row(
      children: [
        _buildActionButton(
          icon: Icons.history,
          label: 'Voir mes paiements',
          color: Colors.blue[700]!,
          onTap: () {
            // Naviguer vers historique paiements
          },
        ),
        const SizedBox(width: 12),
        _buildActionButton(
          icon: Icons.description_outlined,
          label: 'Mon contrat',
          color: Colors.green[700]!,
          onTap: () {
            // Naviguer vers contrat
          },
        ),
        const SizedBox(width: 12),
        _buildActionButton(
          icon: Icons.build_outlined,
          label: 'Demande de réparation',
          color: Colors.orange[700]!,
          onTap: () {
            // Naviguer vers demandes
          },
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: color,
                size: 28,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================
  // DERNIERS PAIEMENTS (LISTE)
  // ==========================================
  Widget _buildDerniersPaiements() {
    final paiements = [
      {'mois': 'Mai 2026', 'mode': 'Mobile Money', 'montant': '150 000 XOF'},
      {'mois': 'Avril 2026', 'mode': 'Espèces', 'montant': '75 000 XOF'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
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
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // ==========================================
  // BARRE DE NAVIGATION EN BAS
  // ==========================================
  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue[800],
      unselectedItemColor: Colors.grey[600],
      selectedFontSize: 12,
      unselectedFontSize: 12,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description_outlined),
          label: 'Contrat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payments_outlined),
          label: 'Paiements',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.build_outlined),
          label: 'Demandes',
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            // Déjà sur l'accueil
            break;
          case 1:
            // Naviguer vers contrat (à créer)
            break;
          case 2:
            // Naviguer vers paiements (à créer)
            break;
          case 3:
            // Naviguer vers demandes (à créer)
            break;
        }
      },
    );
  }

  // ==========================================
  // DIALOGUE DE DÉCONNEXION
  // ==========================================
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Déconnexion'),
        content: const Text('Voulez-vous vraiment vous déconnecter ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Déconnexion
              context.go('/');
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Se déconnecter'),
          ),
        ],
      ),
    );
  }
}