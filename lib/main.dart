import 'package:flutter/material.dart';
import 'package:news_app/screens/screens.dart';
import 'package:news_app/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: const TabsScreen(),
    );
  }
}