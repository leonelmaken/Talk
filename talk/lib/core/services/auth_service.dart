// TODO Implement this library.
import 'package:flutter/foundation.dart';

// Classe pour représenter un utilisateur
class User {
  final String id;
  final String username;
  final String email;

  User({required this.id, required this.username, required this.email});
}

// Service d'authentification
class AuthService extends ChangeNotifier {
  // Utilisateur actuellement connecté (null si non connecté)
  User? _currentUser;

  // Getter pour l'utilisateur actuel
  User? get currentUser => _currentUser;

  // Getter pour l'ID de l'utilisateur actuel
  String get currentUserId => _currentUser?.id ?? '';

  // Méthode pour simuler la connexion
  Future<bool> login(String email, String password) async {
    // Simule une vérification d'authentification
    await Future.delayed(Duration(seconds: 2));
    
    // Vérifie les identifiants (ceci est une simulation)
    if (email == 'user@example.com' && password == 'password') {
      _currentUser = User(
        id: '123',
        username: 'John Doe',
        email: email,
      );
      notifyListeners();
      return true;
    }
    return false;
  }

  // Méthode pour simuler l'inscription
  Future<bool> register(String username, String email, String password) async {
    // Simule une vérification et création de compte
    await Future.delayed(Duration(seconds: 2));
    
    // Dans une vraie application, vous vérifieriez si l'email est déjà utilisé
    _currentUser = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      username: username,
      email: email,
    );
    notifyListeners();
    return true;
  }

  // Méthode pour se déconnecter
  Future<void> logout() async {
    // Simule une déconnexion
    await Future.delayed(Duration(seconds: 1));
    _currentUser = null;
    notifyListeners();
  }

  // Méthode pour vérifier si l'utilisateur est connecté
  bool isLoggedIn() {
    return _currentUser != null;
  }

  // Méthode pour mettre à jour le profil de l'utilisateur
  Future<bool> updateProfile(String username) async {
    // Simule une mise à jour de profil
    await Future.delayed(Duration(seconds: 1));
    if (_currentUser != null) {
      _currentUser = User(
        id: _currentUser!.id,
        username: username,
        email: _currentUser!.email,
      );
      notifyListeners();
      return true;
    }
    return false;
  }
}

// Powered by leonelmaken