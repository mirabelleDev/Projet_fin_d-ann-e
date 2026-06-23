import 'package:flutter/material.dart';

class DashboardProprietaireScreen extends StatelessWidget {
  const DashboardProprietaireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GESTILOYER - Propriétaire'),
        backgroundColor: Colors.blue[800],
      ),
      body: const Center(
        child: Text(
          'Dashboard Propriétaire (à construire)',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}