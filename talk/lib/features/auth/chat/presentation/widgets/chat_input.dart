// TODO Implement this library.
import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final Function(String) onSendMessage;

  ChatInput({required this.onSendMessage});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                onSendMessage(_controller.text);  // Envoie le message
                _controller.clear();  // Vide le champ après envoi
              }
            },
          ),
        ],
      ),
    );
  }
}
//powered by leonelmaken