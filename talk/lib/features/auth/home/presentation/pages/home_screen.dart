import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk/calls/presentation/pages/call_history_screen.dart';
import 'package:talk/core/services/chat_service.dart';
import 'package:talk/features/auth/chat/presentation/pages/chat_screen.dart';
import 'package:talk/features/auth/settings/presentation/pages/settings_screen.dart';
import 'package:talk/features/core/models/contact.dart' as contact_models; // Utiliser un alias
import 'package:talk/core/services/chat_service.dart' as chat_services; // Utiliser un alias

import '../widgets/contact_list_item.dart' as auth_widgets;
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Liste des widgets pour chaque onglet
  final List<Widget> _widgetOptions = <Widget>[
    _ChatList(),
    CallHistoryScreen(),
    SettingsScreen(),
  ];

  // Méthode pour changer l'onglet sélectionné
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // Récupérer les contacts lors de l'initialisation de l'écran
    final chatService = Provider.of<ChatService>(context, listen: false);
    chatService.fetchContacts(); // Appel de la méthode pour récupérer les contacts
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
              // TODO: Implémenter la fonctionnalité de recherche
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

// Widget pour afficher la liste des chats
class _ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Vérifiez que le service est bien disponible
    final chatService = Provider.of<ChatService>(context);
    
    // Debugging pour vérifier les contacts
    print('Contacts: ${chatService.allContacts}'); // Vérifiez si cela retourne bien des contacts

    return ListView.builder(
      itemCount: chatService.allContacts.length,
      itemBuilder: (context, index) {
        final contact = chatService.allContacts[index];
        return auth_widgets.ContactListItem( // Utilisation de l'alias pour éviter le conflit
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
