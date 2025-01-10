import 'package:flutter/material.dart';

Widget buildHighlightedText({
  required String text,
  required List<String> highlights,
  double fontSize = 16.0,
}) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: fontSize,color: Colors.white),
      children: _highlightText(text, highlights),
    ),
    overflow: TextOverflow.visible, // Permite quebra de linha
    maxLines: null, // Permite o texto expandir sem limite de linhas
  );
}

List<TextSpan> _highlightText(String text, List<String> highlights) {
  final spans = <TextSpan>[];
  String remainingText = text;

  for (final highlight in highlights) {
    final index = remainingText.indexOf(highlight);

    if (index >= 0) {
      // Adiciona texto normal antes do highlight
      if (index > 0) {
        spans.add(TextSpan(text: remainingText.substring(0, index)));
      }

      // Adiciona o texto destacado
      spans.add(
        TextSpan(
          text: highlight,
          style: const TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
        ),
      );

      // Atualiza o texto restante
      remainingText = remainingText.substring(index + highlight.length);
    }
  }

  // Adiciona o restante do texto
  if (remainingText.isNotEmpty) {
    spans.add(TextSpan(text: remainingText));
  }

  return spans;
}
