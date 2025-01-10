import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/modules/textWithHilight.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/CustomAppBar.dart';
import '../icons/icons.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Projects", context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.2,
            horizontal: 16,
          ),
          child: Column(
            children: [
              buildHighlightedText(
                text: 'Meus Projetos',
                highlights: ["Projetos"],
                fontSize: 32,
              ),
              const Text(
                'Aqui temos alguns dos projetos que criei.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 24,
                      runSpacing: 24,
                      children: [
                        _buildProjectCard(
                          'Cris\' Adventures',
                          'Um jogo educativo desenvolvido em poucos dias com a ajuda de amigos para fazer as artes e design.',
                          'assets/images/cris.png',
                          [
                            Link('Play Store', 'https://play.google.com/store/apps/details?id=com.godot.crisadventures', playStore),
                            Link('Itch.io', 'https://lucack.itch.io/cris-adventures', itchIO),
                          ],
                          constraints.maxWidth,
                        ),
                        _buildProjectCard(
                          'Pong Game',
                          'Meu segundo jogo desenvolvido em Python utilizando Kivy. 2 jogadores.',
                          'assets/images/ponggame.png',
                          [Link('Itch.io', 'https://lucack.itch.io/pong-game', itchIO)],
                          constraints.maxWidth,
                        ),
                        _buildProjectCard(
                          'Bounce Game',
                          'Meu primeiro jogo desenvolvido do zero em Python utilizando Tkinter.',
                          'assets/images/bouncegame.png',
                          [Link('Itch.io', 'https://lucack.itch.io/bounce-game', itchIO)],
                          constraints.maxWidth,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(
    String title,
    String description,
    String imagePath,
    List<Link> links,
    double maxWidth,
  ) {
    return Container(
      width: maxWidth > 600 ? 350 : maxWidth,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(description),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: links
                      .map(
                        (link) => ElevatedButton(
                          onPressed: () => _launchURL(link.url),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.string(link.iconSvg, width: 24, height: 24),
                              const SizedBox(width: 8),
                              Text(link.text),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class Link {
  final String text;
  final String url;
  final String iconSvg;


  Link(this.text, this.url, this.iconSvg);
}
