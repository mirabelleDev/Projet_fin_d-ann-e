import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/user.dart';
import '../../repositories/auth_repository.dart';

// États
abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  final Role? selectedRole; // pour savoir quel rôle est sélectionné dans l'écran de sélection
  const AuthInitial({this.selectedRole});
  @override
  List<Object?> get props => [selectedRole];
}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;
  const AuthAuthenticated(this.user);
  @override
  List<Object?> get props => [user];
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
  @override
  List<Object?> get props => [message];
}

// Cubit
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository = AuthRepository();

  AuthCubit() : super(AuthInitial());

  // Changer le rôle sélectionné (depuis l'écran de sélection)
  void selectRole(Role role) {
    emit(AuthInitial(selectedRole: role));
  }

  // Connexion
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    final user = await _repository.login(email, password);
    if (user != null) {
      emit(AuthAuthenticated(user));
    } else {
      emit(AuthError('Email ou mot de passe incorrect'));
    }
  }

  // Inscription
  Future<void> register(String nom, String email, String password, Role role) async {
    emit(AuthLoading());
    final user = await _repository.register(nom, email, password, role);
    if (user != null) {
      emit(AuthAuthenticated(user));
    } else {
      emit(AuthError("Erreur lors de l'inscription"));
    }
  }

  // Déconnexion
  void logout() {
    emit(AuthInitial());
  }
}