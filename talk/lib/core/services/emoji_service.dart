import 'package:flutter/material.dart';

class EmojiService extends ChangeNotifier {
  // Liste des emojis récemment utilisés
  List<String> _recentEmojis = [];

  // Getter pour accéder aux emojis récents
  List<String> get recentEmojis => _recentEmojis;

  // Catégories d'emojis (à étendre selon vos besoins)
  final Map<String, List<String>> _emojiCategories = {
    'Smileys': ['😀', '😃', '😄', '😁', '😆', '😅', '😂', '🤣'],
    'Animals': ['🐶', '🐱', '🐭', '🐹', '🐰', '🦊', '🐻', '🐼'],
    'Food': ['🍎', '🍐', '🍊', '🍋', '🍌', '🍉', '🍇', '🍓'],
    'Activities': ['⚽️', '🏀', '🏈', '⚾️', '🎾', '🏐', '🏉', '🎱'],
  };

  // Getter pour accéder aux catégories d'emojis
  Map<String, List<String>> get emojiCategories => _emojiCategories;

  // Ajoute un emoji à la liste des récents
  void addRecentEmoji(String emoji) {
    _recentEmojis.remove(emoji);  // Retire l'emoji s'il est déjà présent
    _recentEmojis.insert(0, emoji);  // Ajoute l'emoji au début de la liste
    if (_recentEmojis.length > 30) {
      _recentEmojis.removeLast();  // Limite la liste à 30 emojis
    }
    notifyListeners();
  }

  // Retourne une liste d'emojis par catégorie
  List<String> getEmojisByCategory(String category) {
    return _emojiCategories[category] ?? [];
  }

  // Recherche des emojis basés sur un mot-clé
  List<String> searchEmojis(String keyword) {
    List<String> results = [];
    _emojiCategories.forEach((category, emojis) {
      results.addAll(emojis.where((emoji) => 
        emoji.toLowerCase().contains(keyword.toLowerCase())));
    });
    return results;
  }

  // Supprime un emoji de la liste des récents
  void removeRecentEmoji(String emoji) {
    _recentEmojis.remove(emoji);
    notifyListeners();
  }

  // Vide la liste des emojis récents
  void clearRecentEmojis() {
    _recentEmojis.clear();
    notifyListeners();
  }
}

// Power By leonelmaken