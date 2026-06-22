import 'package:flutter/material.dart';

class DashboardGerantScreen extends StatelessWidget {
  const DashboardGerantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GESTILOYER - Gérant'),
        backgroundColor: Colors.blue[800],
      ),
      body: const Center(
        child: Text(
          'Dashboard Gérant (à construire)',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}