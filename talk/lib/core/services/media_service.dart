import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MediaService extends ChangeNotifier {
  final ImagePicker _picker = ImagePicker();

  // Liste des chemins des médias récemment sélectionnés
  List<String> _recentMediaPaths = [];

  // Getter pour accéder aux médias récents
  List<String> get recentMediaPaths => _recentMediaPaths;

  // Importe une image depuis la galerie
  Future<String?> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _addToRecentMedia(image.path);
      return image.path;
    }
    return null;
  }

  // Prend une photo avec la caméra
  Future<String?> takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      _addToRecentMedia(photo.path);
      return photo.path;
    }
    return null;
  }

  // Enregistre un message audio
  Future<String?> recordAudio() async {
    // TODO: Implémenter l'enregistrement audio
    // Cela nécessitera probablement une bibliothèque audio tierce
    print('Audio recording not implemented yet');
    return null;
  }

  // Sélectionne un fichier (document, etc.)
  Future<String?> pickFile() async {
    // TODO: Implémenter la sélection de fichier
    // Vous pouvez utiliser la bibliothèque file_picker pour cela
    print('File picking not implemented yet');
    return null;
  }

  // Ajoute un chemin de média à la liste des médias récents
  void _addToRecentMedia(String path) {
    _recentMediaPaths.insert(0, path);
    if (_recentMediaPaths.length > 10) {
      _recentMediaPaths.removeLast();
    }
    notifyListeners();
  }

  // Supprime un média de l'appareil et de la liste des récents
  Future<void> deleteMedia(String path) async {
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
      _recentMediaPaths.remove(path);
      notifyListeners();
    }
  }
}

// Power By leonelmaken