import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk/calls/presentation/pages/call_history_screen.dart';
import 'package:talk/features/auth/chat/presentation/pages/chat_screen.dart';
import 'package:talk/features/auth/settings/presentation/pages/settings_screen.dart';
import '../../../../core/services/chat_service.dart';
import '../../../../core/services/call_service.dart';
import '../../../../core/services/auth_service.dart';

// Define the Contact model
class Contact {
  final String id;
  final String name;
  final String? avatarUrl;
  final String? lastMessage;
  final int unreadCount;

  Contact({
    required this.id, 
    required this.name, 
    this.avatarUrl, 
    this.lastMessage, 
    this.unreadCount = 0
  });
}

// CallService implementation
class CallService {
  final List<Contact> contacts = [
    Contact(id: '1', name: 'John Doe', lastMessage: 'Hello!', unreadCount: 2),
    Contact(id: '2', name: 'Jane Doe', lastMessage: 'How are you?', unreadCount: 0),
  ];

  List<Contact> get callHistory => contacts;

  startVideoCall(String contactId) {}

  startAudioCall(String contactId) {}

  void removeFromCallHistory(String id) {}
}

// ChatService implementation
class ChatService {
  final List<Contact> contacts = [
    Contact(id: '1', name: 'John Doe', lastMessage: 'Hello!', unreadCount: 2),
    Contact(id: '2', name: 'Jane Doe', lastMessage: 'How are you?', unreadCount: 0),
  ];

  List<Contact> get allContacts => contacts;

  getMessagesForContact(String contactId) {}

  void sendMessage(String contactId, String content) {}
}

// AuthService implementation
class AuthService {
  final String userId = "123";
  String get currentUserId => userId;
}

// HomeScreen widget
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of widgets for each tab
  final List<Widget> _widgetOptions = <Widget>[
    _ChatList(),
    CallHistoryScreen(),
    SettingsScreen(),
  ];

  // Method to change the selected tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Talk'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Widget to display the list of chats
class _ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatService = Provider.of<ChatService>(context);
    return ListView.builder(
      itemCount: chatService.allContacts.length,
      itemBuilder: (context, index) {
        final contact = chatService.allContacts[index];
        return ContactListItem(
          contact: contact,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(contactId: contact.id),
              ),
            );
          },
        );
      },
    );
  }
}

// ContactListItem widget
class ContactListItem extends StatelessWidget {
  final Contact contact;
  final VoidCallback onTap;

  const ContactListItem({
    Key? key,
    required this.contact,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: contact.avatarUrl != null
            ? NetworkImage(contact.avatarUrl!)
            : null,
        child: contact.avatarUrl == null
            ? Text(contact.name[0])
            : null,
      ),
      title: Text(contact.name),
      subtitle: Text(contact.lastMessage ?? ''),
      trailing: contact.unreadCount > 0
          ? CircleAvatar(
              radius: 12,
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(
                contact.unreadCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          : null,
      onTap: onTap,
    );
  }
}