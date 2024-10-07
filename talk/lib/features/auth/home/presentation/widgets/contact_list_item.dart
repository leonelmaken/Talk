// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../../core/models/contact.dart';

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

// Power By leonelmaken