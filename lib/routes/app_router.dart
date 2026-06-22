import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/auth/selection_profil_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/locataire/dashboard_locataire_screen.dart';
import '../screens/gerant/dashboard_gerant_screen.dart';
import '../screens/proprietaire/dashboard_proprietaire_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'selection',
        builder: (context, state) => SelectionProfilScreen(), // ⬅️ ENLEVÉ const
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => LoginScreen(), // ⬅️ ENLEVÉ const
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => RegisterScreen(), // ⬅️ ENLEVÉ const
      ),
      GoRoute(
        path: '/locataire/dashboard',
        name: 'locataire_dashboard',
        builder: (context, state) => const DashboardLocataireScreen(), // ⬅️ GARDÉ const (car StatelessWidget le supporte)
      ),
      GoRoute(
        path: '/gerant/dashboard',
        name: 'gerant_dashboard',
        builder: (context, state) => const DashboardGerantScreen(), // ⬅️ GARDÉ const
      ),
      GoRoute(
        path: '/proprietaire/dashboard',
        name: 'proprietaire_dashboard',
        builder: (context, state) => const DashboardProprietaireScreen(), // ⬅️ GARDÉ const
      ),
    ],
  );
}