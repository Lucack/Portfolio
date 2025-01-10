import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/about.dart';
import 'package:portfolio/screens/home.dart';
import 'package:portfolio/screens/projects.dart';
import 'package:portfolio/screens/resume.dart';

import '../globals.dart';

AppBar CustomAppBar(String title, BuildContext context) {
  // Detecta se é mobile ou não baseado na largura da tela
  return AppBar(
    elevation: 2,
    title: Text(title),
    actions: isMobile
        ? [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Align(
                    alignment: Alignment.centerRight,
                    child: FractionallySizedBox(
                      widthFactor: 0.6, // Ocupa 60% da largura da tela
                      child: Drawer(
                        child: ListView(
                          children: [
                            const DrawerHeader(
                              child: Center(
                                child: Text(
                                  'Navigation',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            ),
                            _drawerButton(context, "Home", HomeScreen()),
                            _drawerButton(context, "About", AboutSection()),
                            _drawerButton(context, "Projects", ProjectsSection()),
                            _drawerButton(context, "Resume", ResumeSection()),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ]
        : [
            appBarButton("Home", HomeScreen(), context),
            appBarButton("About", AboutSection(), context),
            appBarButton("Projects", ProjectsSection(), context),
            appBarButton("Resume", ResumeSection(), context),
          ],
  );
}

TextButton appBarButton(String title, Widget screen, BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    },
    child: Text(
      title,
      style: const TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}

ListTile _drawerButton(BuildContext context, String title, Widget screen) {
  return ListTile(
    title: Text(title),
    onTap: () {
      Navigator.pop(context); // Fecha o Drawer
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    },
  );
}

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const CustomScaffold({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600; // Verifica o tamanho da tela

    return Scaffold(
      appBar: CustomAppBar(title, context),
      body: body,
    );
  }
}
