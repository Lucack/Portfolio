import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../icons/icons.dart';
import '../../modules/textWithHilight.dart';

Widget buildInfoSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Um pouco sobre mim',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        _buildInfoItem(
          iconStudentCap,
          'Sou estudante do curso de Ciência da Computação na Universidade Federal do ABC - UFABC.',
          ['Ciência da Computação', 'Universidade Federal do ABC - UFABC'],
        ),
        _buildInfoItem(
          iconStudentCap,
          'Realizei pesquisas na área de Engenharia de Software com foco em Métodos Ágeis.',
          ['Engenharia de Software'],
        ),
        _buildInfoItem(
          iconStudentCap,
          'Desenvolvo alguns jogos multiplataformas com amigos.',
          ['jogos multiplataformas'],
        ),
        _buildInfoItem(
          iconStudentCap,
          'Atualmente, enquanto continuo meus projetos pessoais e meus estudos, sou estagiário na área de Desenvolvimento Full Stack no Itaú Unibanco.',
          ['projetos pessoais', 'Itaú Unibanco'],
        ),
      ],
    ),
  );
}

Widget _buildInfoItem(String emoji, String text, List<String> highlights) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.string(
          emoji,
          colorFilter: const ColorFilter.mode(
            Colors.cyan,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: buildHighlightedText(
            text: text,
            highlights: highlights,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}