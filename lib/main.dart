import 'package:contacts_app/screens/home/splash_screen.dart';
import 'package:contacts_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ContactsApp());
}

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      title: 'Contacts App',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}