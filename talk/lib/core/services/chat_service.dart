import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:talk/features/core/models/contact.dart'; // Assurez-vous que c'est correct

class Message {
  final String id;
  final String senderId;
  final String receiverId;
  final String content;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.timestamp,
  });
}
// Service de gestion du chat
class ChatService extends ChangeNotifier {
  // Liste des contacts
  List<Contact> _contacts = [];
  
  // Dictionnaire contenant les messages par contact (clé: contactId, valeur: liste de messages)
  Map<String, List<Message>> _messages = {};

  // Getter pour obtenir tous les contacts
  List<Contact> get allContacts => _contacts;

  // Méthode pour récupérer les contacts (simulation)
  Future<void> fetchContacts() async {
    // Simulation d'un appel API
    await Future.delayed(Duration(seconds: 1));
    _contacts = [
      Contact(id: '1', name: 'John Doe', lastMessage: 'Salut !', unreadCount: 2),
      Contact(id: '2', name: 'Jane Smith', lastMessage: 'Comment ça va ?', unreadCount: 0),
      Contact(id: '3', name: 'Alice Johnson', lastMessage: 'À plus tard', unreadCount: 1),
    ];
    notifyListeners();
  }

  // Méthode pour récupérer les messages d'un contact spécifique
  List<Message> getMessagesForContact(String contactId) {
    return _messages[contactId] ?? [];
  }

  // Méthode pour envoyer un message à un contact
  Future<void> sendMessage(String contactId, String content) async {
    // Simulation d'envoi de message
    await Future.delayed(Duration(milliseconds: 500));
    final newMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: 'currentUserId', // Remplacer par l'ID de l'utilisateur actuel
      receiverId: contactId,
      content: content,
      timestamp: DateTime.now(),
    );

    // Si c'est le premier message de ce contact, initialiser la liste des messages
    if (!_messages.containsKey(contactId)) {
      _messages[contactId] = [];
    }
    _messages[contactId]!.add(newMessage);

    // Mettre à jour le dernier message et réinitialiser le nombre de messages non lus
    final contactIndex = _contacts.indexWhere((c) => c.id == contactId);
    if (contactIndex != -1) {
      _contacts[contactIndex] = Contact(
        id: _contacts[contactIndex].id,
        name: _contacts[contactIndex].name,
        avatarUrl: _contacts[contactIndex].avatarUrl,
        lastMessage: content,
        unreadCount: 0, // Réinitialiser le compteur de messages non lus
      );
    }

    notifyListeners();
  }

  // Méthode pour marquer les messages comme lus pour un contact
  void markMessagesAsRead(String contactId) {
    final contactIndex = _contacts.indexWhere((c) => c.id == contactId);
    if (contactIndex != -1) {
      _contacts[contactIndex] = Contact(
        id: _contacts[contactIndex].id,
        name: _contacts[contactIndex].name,
        avatarUrl: _contacts[contactIndex].avatarUrl,
        lastMessage: _contacts[contactIndex].lastMessage,
        unreadCount: 0, // Réinitialiser le compteur de messages non lus
      );
      notifyListeners();
    }
  }

  // Méthode pour rechercher des contacts par nom
  List<Contact> searchContacts(String query) {
    return _contacts.where((contact) =>
        contact.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
}
