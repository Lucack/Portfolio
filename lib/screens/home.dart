import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/CustomAppBar.dart';
import '../components/home/Contact.dart';
import '../components/home/IntroTextAnimated.dart';
import '../components/home/MoreAbout.dart';
import '../globals.dart';
import '../icons/icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("", context),
      body: ListView(
        children: [

          if (isMobile)
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
          isMobile
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IntroTextAnimated(),
                    Center(
                      child: SvgPicture.string(
                        ImageDev,
                        height: 400,
                        fit: BoxFit.contain, // Ajusta a escala do SVG
                      ),
                    ),
                  ],
                )
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: isMobile ? 0 : MediaQuery.of(context).size.height * .2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IntroTextAnimated(),
                      Center(
                        child: SvgPicture.string(
                          ImageDev,
                          height: MediaQuery.of(context).size.height * .6,
                          fit: BoxFit.contain, // Ajusta a escala do SVG
                        ),
                      ),
                    ],
                  ),
                ),
          const SizedBox(height: 48),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1),
            child: buildInfoSection(),
          ),
          const SizedBox(height: 48),
          SvgPicture.string(
            ImageAvatar,
            width: MediaQuery.of(context).size.height * .3,
            fit: BoxFit.contain, // Ajusta a escala do SVG
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1),
            child: buildContactSection(),
          ),
        ],
      ),
    );
  }
}
