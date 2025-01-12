import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:Portfolio/globals.dart';

class IntroTextAnimated extends StatefulWidget {
  const IntroTextAnimated({super.key});

  @override
  State<IntroTextAnimated> createState() => _IntroTextAnimatedState();
}

class _IntroTextAnimatedState extends State<IntroTextAnimated>
    with SingleTickerProviderStateMixin {
  // Definição de variáveis para tamanhos de fonte
  final int headingFontSize = isMobile? 32: 40;
  final int wavingEmojiFontSize =  isMobile? 32: 40;
  final int richTextFontSize =  isMobile? 30: 32;
  final int animatedTextFontSize =  isMobile? 24: 30;

  late AnimationController _controller;
  late Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _waveAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 14.0), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 14.0, end: -8.0), weight: 10),
      TweenSequenceItem(tween: Tween(begin: -8.0, end: 14.0), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 14.0, end: -4.0), weight: 10),
      TweenSequenceItem(tween: Tween(begin: -4.0, end: 10.0), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 10.0, end: 0.0), weight: 50),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Faz com que a coluna ocupe apenas o espaço necessário
        crossAxisAlignment: CrossAxisAlignment.start, // Alinha os itens à esquerda
        mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Olá! ",
                style: TextStyle(
                  fontSize: headingFontSize.toDouble(),
                  fontWeight: FontWeight.bold,
                ),
              ),
              AnimatedBuilder(
                animation: _waveAnimation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _waveAnimation.value * 0.0174533, // Convertendo para radianos
                    alignment: Alignment.bottomRight, // Alterado para girar em torno do eixo
                    child: child,
                  );
                },
                child: Text(
                  "👋🏻",
                  style: TextStyle(fontSize: wavingEmojiFontSize.toDouble()),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: richTextFontSize.toDouble(),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              children: [
                const TextSpan(text: "Eu sou "),
                const TextSpan(
                  text: "Lucas Santana Santos",
                  style: TextStyle(color: Colors.cyan), // Diferencie com uma cor, se desejar
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .08,
          ),
          AnimatedTextKit(
            animatedTexts: [
              animatexTextCustom("Student"),
              animatexTextCustom("Game Developer"),
              animatexTextCustom("Mobile Developer"),
              animatexTextCustom("Flutter Developer"),
            ],
            pause: const Duration(seconds: 1),
            repeatForever: true,
          ),
        ],
      ),
    );
  }

  TypewriterAnimatedText animatexTextCustom(String text) {
    return TypewriterAnimatedText(
      text,
      textStyle: TextStyle(
        fontSize: animatedTextFontSize.toDouble(),
        color: Colors.cyan,
        fontWeight: FontWeight.bold,
      ),
      speed: const Duration(milliseconds: 150),
    );
  }
}
