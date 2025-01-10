import 'package:flutter/material.dart';

import '../../modules/textWithHilight.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHighlightedText(
          text: 'Me conheça melhor',
          highlights: ["conheça"],
          fontSize: 32,
        ),
        const SizedBox(height: 24),
        buildHighlightedText(
          text: 'Olá, eu sou Lucas Santana Santos de São Paulo, Brasil.',
          highlights: ["Lucas Santana Santos", "São Paulo, Brasil"],
          fontSize: 18,
        ),
        const SizedBox(height: 16),
        Flexible(
          child: const Text(
            'Atualmente sou estudante da UFABC no curso de Ciência da Computação e estou procurando por um emprego.',
            style: TextStyle(fontSize: 18),
            overflow: TextOverflow.visible,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Me interesso por computação desde pequeno, e a cada dia que passa crio novos objetivos pessoais para alcançar a liberdade que almejo na criação de soluções digitais.',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 24),
        const Text(
          'Graças à essa motivação, consegui aprender bastante sobre programação nos últimos anos e inclusive consegui publicar um App na Play Store! Esse é só o começo...',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
