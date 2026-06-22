import 'package:flutter/material.dart';

class DashboardLocataireScreen extends StatelessWidget {
  const DashboardLocataireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GESTILOYER - Locataire'),
        backgroundColor: Colors.blue[800],
      ),
      body: const Center(
        child: Text(
          'Dashboard Locataire (à construire)',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}