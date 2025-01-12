import 'package:flutter/material.dart';
import 'package:Portfolio/screens/home.dart';
import 'globals.dart';
import 'theme.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width < 1024;

    return MaterialApp(
      title: 'Lucas Santana Santos',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
