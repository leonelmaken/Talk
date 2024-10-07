// Powered by leonelmaken

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk/features/core/models/contact.dart';  // Assurez-vous que le modèle Contact est bien défini

import '../widgets/message_bubble.dart';  // Assurez-vous que ce widget est bien défini
import '../widgets/chat_input.dart';  // Assurez-vous que ce widget est bien défini

// Classe ChatScreen qui représente l'écran de chat avec un contact spécifique
class ChatScreen extends StatelessWidget {
  final String contactId; // L'identifiant du contact avec qui on discute

  // Constructeur
  const ChatScreen({Key? key, required this.contactId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Récupère les services de chat et d'appel via Provider
    final chatService = Provider.of<ChatService>(context);
    final callService = Provider.of<CallService>(context, listen: false); // Le listen: false indique que ce widget ne redessine pas quand callService change.

    // Construit l'interface utilisateur
    return Scaffold(
      appBar: AppBar(
        // Titre de l'AppBar basé sur le nom du contact
        title: Text(chatService.contacts.firstWhere((contact) => contact.id == contactId).name),
        actions: [
          // Bouton pour démarrer un appel vidéo
          IconButton(
            icon: const Icon(Icons.video_call),
            onPressed: () => callService.startVideoCall(contactId), // Appel à la méthode startVideoCall
          ),
          // Bouton pour démarrer un appel audio
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () => callService.startAudioCall(contactId), // Appel à la méthode startAudioCall
          ),
        ],
      ),
      body: Column(
        children: [
          // Widget Expanded pour permettre à la liste des messages d'occuper tout l'espace disponible
          Expanded(
            child: Consumer<ChatService>(
              builder: (context, chatService, child) {
                // Récupère les messages pour le contact spécifié
                final messages = chatService.getMessagesForContact(contactId);
                return ListView.builder(
                  reverse: true, // Affiche les messages du plus récent au plus ancien
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    // Retourne un widget MessageBubble pour chaque message
                    return MessageBubble(message: messages[index]);
                  },
                );
              },
            ),
          ),
          // Champ de saisie pour envoyer des messages
          ChatInput(
            onSendMessage: (String content) {
              chatService.sendMessage(contactId, content); // Envoie le message via le service de chat
            },
          ),
        ],
      ),
    );
  }
}
//powerd by leonelmaken
