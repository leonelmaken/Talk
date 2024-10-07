import 'package:flutter/material.dart';

class CallService extends ChangeNotifier {
  // Indique si un appel est en cours
  bool _isInCall = false;
  // Indique si l'appel en cours est un appel vidéo
  bool _isVideoCall = false;

  // Getters pour accéder à l'état de l'appel
  bool get isInCall => _isInCall;
  bool get isVideoCall => _isVideoCall;

  // Méthode pour démarrer un appel audio
  void startAudioCall(String contactId) {
    _isInCall = true;
    _isVideoCall = false; // L'appel n'est pas vidéo, donc faux
    // Logique pour démarrer un appel audio (à implémenter)
    print('Démarrage de l\'appel audio avec $contactId');
    notifyListeners(); // Notifie les widgets écoutant ce service que l'état a changé
  }

  // Méthode pour démarrer un appel vidéo
  void startVideoCall(String contactId) {
    _isInCall = true;
    _isVideoCall = true; // L'appel est vidéo, donc vrai
    // Logique pour démarrer un appel vidéo (à implémenter)
    print('Démarrage de l\'appel vidéo avec $contactId');
    notifyListeners(); // Notifie les widgets écoutant ce service que l'état a changé
  }

  // Méthode pour terminer l'appel en cours
  void endCall() {
    _isInCall = false;
    _isVideoCall = false; // Réinitialise l'état de l'appel
    // Logique pour terminer l'appel (à implémenter)
    print('Fin de l\'appel en cours');
    notifyListeners();
  }

  // Bascule entre l'audio et la vidéo pendant un appel
  void toggleVideo() {
    if (_isInCall) {
      _isVideoCall = !_isVideoCall; // Inverse l'état de la vidéo
      // Logique pour activer/désactiver la vidéo (à implémenter)
      print(_isVideoCall ? 'Vidéo activée' : 'Vidéo désactivée');
      notifyListeners();
    }
  }

  // Mettre l'appel en sourdine (logiciel)
  void toggleMute() {
    // Logique pour mettre en sourdine (à implémenter)
    print('Sourdine activée/désactivée');
    notifyListeners();
  }
}
//powered by leonelmaken