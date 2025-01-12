import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/CustomAppBar.dart';
import '../components/about/AboutMe.dart';
import '../globals.dart';
import '../icons/icons.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("", context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        children: [
          if (isMobile)
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? MediaQuery.of(context).size.width * .1 : 0,
                vertical: isMobile ? 0 : MediaQuery.of(context).size.height * .2),
            child: isMobile
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.height * .6),
                        child: AboutMe(),
                      ),
                      Center(
                        child: SvgPicture.string(
                          ImageDev,
                          width: MediaQuery.of(context).size.width * .7,
                          fit: BoxFit.contain, // Ajusta a escala do SVG
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * .1)
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .3),
                        child: AboutMe(),
                      ),
                      Spacer(),
                      Center(
                        child: SvgPicture.string(
                          ImageDev,
                          height: MediaQuery.of(context).size.height * .4,
                          fit: BoxFit.contain, // Ajusta a escala do SVG
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? MediaQuery.of(context).size.width * .1 : 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Existem outras coisas que também gosto de fazer',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .05),
                _buildHobbyList(18),
                SizedBox(height: MediaQuery.of(context).size.height * .05),
                Center(
                  child: isMobile
                      ? SvgPicture.string(
                          devMusic,
                          width: MediaQuery.of(context).size.width * .6,
                          fit: BoxFit.contain, // Ajusta a escala do SVG
                        )
                      : SvgPicture.string(
                          devMusic,
                          width: MediaQuery.of(context).size.width * .25,
                          fit: BoxFit.contain, // Ajusta a escala do SVG
                        ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .05),
                const SizedBox(height: 32),
                _buildQuote(),
                const SizedBox(height: 48),
                _buildSkillsSection(),
                const SizedBox(height: 48),
                _buildToolsSection(),
                SizedBox(height: MediaQuery.of(context).size.height * .2),
                // const SizedBox(height: 48),
                // _buildGitHubContributions(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHobbyList(fontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• Jogar com amigos',
          style: TextStyle(fontSize: fontSize),
        ),
        Text(
          '• Viajar',
          style: TextStyle(fontSize: fontSize),
        ),
        Text(
          '• Escutar músicas, sempre estou escutando músicas 😅',
          style: TextStyle(fontSize: fontSize),
        ),
      ],
    );
  }

  Widget _buildQuote() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.cyan),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: const [
          Text(
            '"O único modo de fazer um ótimo trabalho é amar o que você faz."',
            style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 8),
          Text('- Steve Jobs'),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Habilidades Profissionais',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _buildSkillCard('Flutter', flutter),
            _buildSkillCard('Dart', dart),
            _buildSkillCard('Python', python),
            _buildSkillCard('Git', git),
          ],
        ),
      ],
    );
  }

  Widget _buildToolsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ferramentas que utilizo',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _buildSkillCard('VS Code', vscode),
            _buildSkillCard('Android\n Studio', androidStudio),
            _buildSkillCard('GitHub', github),
            _buildSkillCard('Figma', dart),
          ],
        ),
      ],
    );
  }

  Widget _buildSkillCard(String name, String icon) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          SvgPicture.string(
            icon,
            height: 48,
            width: 48,
          ),
          const SizedBox(height: 8),
          Text(name),
        ],
      ),
    );
  }

  Widget _buildGitHubContributions() {
    return Column(
      children: [
        const Text(
          'Days I Code',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        SvgPicture.network(
          'https://ghchart.rshah.org/Lucack',
          height: 100,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
