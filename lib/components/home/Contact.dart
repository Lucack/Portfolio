import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../modules/textWithHilight.dart';

Widget buildContactSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 20,),
      const Text(
        'CONTATO',

        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,letterSpacing: 2),
      ),
      SizedBox(height: 16,),
      buildHighlightedText(
        text: "Conecte-se comigo",
        highlights: ["Conecte-se"],
        fontSize: 18,
      ),
      const SizedBox(height: 24),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSocialIcon(
            FontAwesomeIcons.linkedin,
            'https://www.linkedin.com/in/lucas-santana-contato/',
          ),
          _buildSocialIcon(
            FontAwesomeIcons.github,
            'https://github.com/Lucack',
          ),
        ],
      ),
      SizedBox(height: 20,),
    ],
  );
}

Widget _buildSocialIcon(IconData icon, String url) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: IconButton(
      icon: FaIcon(icon),
      onPressed: () => launchUrl(Uri.parse(url)),
      iconSize: 32,
    ),
  );
}
