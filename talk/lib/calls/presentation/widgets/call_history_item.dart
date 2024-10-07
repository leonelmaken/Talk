import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importation pour le formatage de la date et l'heure
import '../../core/models/CallModel.dart'; // Importation du modèle Call qui représente un appel

// Ce widget représente un élément de l'historique des appels
class CallHistoryItem extends StatelessWidget {
  // Propriétés du widget
  final Call call; // L'objet Call contient les informations relatives à l'appel
  final VoidCallback onTap; // Fonction à exécuter lorsque l'utilisateur clique pour rappeler
  final VoidCallback onDelete; // Fonction à exécuter pour supprimer l'appel de l'historique

  // Constructeur de la classe CallHistoryItem
  const CallHistoryItem({
    required this.call, // L'objet call est requis pour afficher les infos de l'appel
    required this.onTap, // Fonction appelée pour rappeler le contact
    required this.onDelete, // Fonction appelée pour supprimer l'appel de l'historique
    Key? key,
  }) : super(key: key); // Appelle le constructeur parent pour initialiser le widget

  // Méthode pour formater l'heure de l'appel
  String _formatCallTime(DateTime callTime) {
    return DateFormat('h:mm a').format(callTime); // Formatage de l'heure (par ex. '12:30 PM')
  }

  @override
  Widget build(BuildContext context) {
    // Construction de l'élément ListTile qui sera affiché dans l'interface utilisateur
    return ListTile(
      title: Text(
        call.contactName, // Affiche le nom du contact avec qui l'appel a eu lieu
        style: const TextStyle(fontWeight: FontWeight.bold), // Style en gras pour le nom du contact
      ),
      subtitle: Text(
        _formatCallTime(call.timestamp), // Affiche l'heure de l'appel formatée
        style: TextStyle(color: Colors.grey[600]), // Texte de sous-titre en couleur grise
      ),
      leading: Icon(
        call.isVideoCall ? Icons.videocam : Icons.phone, // Icône vidéo ou téléphone selon le type d'appel
        color: call.isVideoCall ? Colors.blue : Colors.green, // Bleu pour vidéo, vert pour appel audio
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red), // Icône de suppression en rouge
        onPressed: onDelete, // Appel de la fonction onDelete pour supprimer l'appel
      ),
      onTap: onTap, // Appel de la fonction onTap pour rappeler le contact lorsque l'utilisateur clique sur l'élément
    );
  }
}
