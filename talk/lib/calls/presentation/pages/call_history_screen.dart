// Importation des bibliothèques nécessaires
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk/calls/core/services/call_service.dart';
 // Mis à jour pour refléter la nouvelle structure
import '../widgets/call_history_item.dart'; 
  // Widget CallHistoryItem importé depuis le répertoire calls/widgets

// Classe représentant l'écran d'historique des appels
class CallHistoryScreen extends StatelessWidget {
  const CallHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call History'), // Titre de l'écran
      ),
      body: Consumer<CallService>(
        // Le Consumer permet d'accéder à l'instance de CallService
        builder: (context, callService, child) {
          return ListView.builder(
            // Utilise un ListView pour afficher la liste des appels
            itemCount: callService.callHistory.length, // Nombre d'éléments dans l'historique d'appels
            itemBuilder: (context, index) {
              final call = callService.callHistory[index]; // Récupère l'appel à l'index donné
              return CallHistoryItem(
                // Utilisation du widget CallHistoryItem pour afficher les détails d'un appel
                call: call,
                onTap: () {
                  // TODO: Implémenter la logique pour rappeler le contact
                  // Ceci est l'endroit où tu implémenteras la fonction pour rappeler un contact
                  print('Rappeler ${call.contactName}');
                },
                onDelete: () {
                  // Supprime l'appel de l'historique en utilisant son ID
                  callService.removeFromCallHistory(call.id); 
                  print('Appel supprimé de l\'historique');
                },
              );
            },
          );
        },
      ),
    );
  }
}
