import 'package:flutter/material.dart';
import '../models/CallModel.dart'; // Assurez-vous d'importer la bonne classe Call depuis CallModel.dart

class CallService with ChangeNotifier {
  final List<Call> _callHistory = [];
  bool _isInCall = false;
  bool _isVideoCall = false;

  List<Call> get callHistory => _callHistory;
  bool get isInCall => _isInCall;
  bool get isVideoCall => _isVideoCall;

  void startAudioCall(String contactId) {
    _isInCall = true;
    _isVideoCall = false;
    _addToCallHistory(Call(
      id: 'audio_${DateTime.now().millisecondsSinceEpoch}',
      contactName: 'Contact Audio',
      timestamp: DateTime.now(), // Utilisation de 'timestamp'
      isVideoCall: false, // Audio call donc false
      duration: 0,
    ));
    notifyListeners();
  }

  void startVideoCall(String contactId) {
    _isInCall = true;
    _isVideoCall = true;
    _addToCallHistory(Call(
      id: 'video_${DateTime.now().millisecondsSinceEpoch}',
      contactName: 'Contact Vidéo',
      timestamp: DateTime.now(),
      isVideoCall: true, // Video call donc true
      duration: 0,
    ));
    notifyListeners();
  }

  void endCall() {
    if (_isInCall) {
      _isInCall = false;
      _isVideoCall = false;
      if (_callHistory.isNotEmpty) {
        _callHistory.first.duration = DateTime.now().difference(_callHistory.first.timestamp).inSeconds;
      }
      notifyListeners();
    }
  }

  void _addToCallHistory(Call call) {
    _callHistory.insert(0, call);
    if (_callHistory.length > 50) {
      _callHistory.removeLast();
    }
  }

  void removeFromCallHistory(String callId) {
    _callHistory.removeWhere((call) => call.id == callId);
    notifyListeners();
  }

  void clearCallHistory() {
    _callHistory.clear();
    notifyListeners();
  }

  void simulateCall() {
    final newCall = Call(
      id: DateTime.now().toString(),
      contactName: "John Doe",
      timestamp: DateTime.now(),
      isVideoCall: false,
      duration: 0,
    );
    _addToCallHistory(newCall);
  }
}
