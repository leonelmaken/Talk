import 'package:flutter/material.dart';

class Call extends ChangeNotifier {
  final String id;
  final String contactName;
  final DateTime timestamp;
  final bool isVideoCall; // Ajout de ce champ
  int duration;

  Call({
    required this.id,
    required this.contactName,
    required this.timestamp,
    required this.isVideoCall,
    this.duration = 0,
  });

  // Factory pour créer un Call à partir d'une Map
  factory Call.fromMap(Map<String, dynamic> map) {
    return Call(
      id: map['id'],
      contactName: map['contactName'],
      timestamp: DateTime.parse(map['timestamp']),
      isVideoCall: map['isVideoCall'],
      duration: map['duration'] ?? 0,
    );
  }

  // Méthode pour convertir un Call en Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'contactName': contactName,
      'timestamp': timestamp.toIso8601String(),
      'isVideoCall': isVideoCall,
      'duration': duration,
    };
  }
}
