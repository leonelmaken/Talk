import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk/core/services/auth_service.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Utilisation correcte de AuthService sans alias
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // TODO: Naviguer vers l'écran de profil
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              // TODO: Naviguer vers les paramètres de notification
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Privacy and Security'),
            onTap: () {
              // TODO: Naviguer vers les paramètres de confidentialité et de sécurité
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            onTap: () {
              // TODO: Naviguer vers l'écran d'aide
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () async {
              await authService.logout();
              // Naviguer vers l'écran de connexion après la déconnexion
              Navigator.of(context).pushReplacementNamed('/login'); // Assurez-vous d'avoir défini cette route
            },
          ),
        ],
      ),
    );
  }
}

// Powered by leonelmaken