import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk/core/services/auth_service.dart';

import 'package:talk/features/auth/home/presentation/pages/home_screen.dart';

import 'calls/core/services/call_service.dart';
import 'core/services/chat_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatService()),
        ChangeNotifierProvider(create: (_) => CallService()),
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
