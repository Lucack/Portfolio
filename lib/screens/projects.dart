import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Portfolio/modules/textWithHilight.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/CustomAppBar.dart';
import '../globals.dart';
import '../icons/icons.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("", context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.1,
            horizontal: 16,
          ),
          child: Column(
            children: [
              buildHighlightedText(
                text: 'Meus Projetos',
                highlights: ["Projetos"],
                fontSize: 40,
              ),
              const SizedBox(height: 16),
              const Text(
                'Aqui temos alguns dos projetos que criei.',
                style: TextStyle(fontSize: 20, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (isMobile) {
                      return ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: _buildProjectCards(),
                      );
                    } else {
                      return Wrap(
                        spacing: MediaQuery.of(context).size.height * 0.05,
                        runSpacing: MediaQuery.of(context).size.height * 0.05,
                        children: _buildProjectCards(isDesktop: true),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildProjectCards({bool isDesktop = false}) {
    final projects = [
      {
        'title': 'Cris\' Adventures',
        'category': 'Games',
        'description': 'Um jogo educativo desenvolvido em poucos dias com a ajuda de amigos.',
        'imagePath': 'assets/images/cris.png',
        'backgroundColor': Color(0xFF151C22),
        'links': [
          Link('Play Store', 'https://play.google.com/store/apps/details?id=com.godot.crisadventures', playStore),
          Link('Itch.io', 'https://lucack.itch.io/cris-adventures', itchIO),
        ],
      },
      {
        'title': 'Pong Game',
        'category': 'Games',
        'description': 'Meu segundo jogo desenvolvido em Python utilizando Kivy.',
        'imagePath': 'assets/images/ponggame.png',
        'backgroundColor': Colors.grey.shade900,
        'links': [Link('Itch.io', 'https://lucack.itch.io/pong-game', itchIO)],
      },
      {
        'title': 'Bounce Game',
        'category': 'Games',
        'description': 'Meu primeiro jogo desenvolvido do zero em Python.',
        'imagePath': 'assets/images/bouncegame.png',
        'backgroundColor': Colors.grey.shade800,
        'links': [Link('Itch.io', 'https://lucack.itch.io/bounce-game', itchIO)],
      },
    ];

    return projects.map((project) {
      final card = _buildProjectCard(
        project['title'] as String,
        project['category'] as String,
        project['description'] as String,
        project['imagePath'] as String,
        project['backgroundColor'] as Color,
        project['links'] as List<Link>,
      );

      return isDesktop
          ? SizedBox(
              width: 600,
              child: card,
            )
          : Column(
              children: [
                card,
                SizedBox(height: 24),
              ],
            );
    }).toList();
  }

  Widget _buildProjectCard(
    String title,
    String category,
    String description,
    String imagePath,
    Color backgroundColor,
    List<Link> links,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 600;
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(24),
          ),
          clipBehavior: Clip.antiAlias,
          child: isWide
              ? Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: _buildCardContent(title, category, description, links),
                    ),
                    Expanded(
                      flex: 2,
                      child: _buildCardImage(imagePath),
                    ),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    _buildCardImage(imagePath),
                    _buildCardContent(title, category, description, links),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildCardContent(String title, String category, String description, List<Link> links) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              category,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: links.map((link) => _buildStoreButton(link)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCardImage(String imagePath) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildStoreButton(Link link) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _launchURL(link.url),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.string(
                  link.iconSvg,
                  width: 20,
                  height: 20,
                ),
                SizedBox(width: 8),
                Text(
                  link.text,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
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
