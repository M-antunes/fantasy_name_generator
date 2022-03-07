import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';

import '../../../shared/themes/app_text_styles.dart';

class ProgressCheck extends StatefulWidget {
  const ProgressCheck({
    Key? key,
  }) : super(key: key);

  @override
  State<ProgressCheck> createState() => _ProgressCheckState();
}

class _ProgressCheckState extends State<ProgressCheck> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<CharController>(builder: (context, state, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
              textAlign: TextAlign.center,
              text:
                  TextSpan(style: AppTextStyle.selectButtonNotReady, children: [
                const TextSpan(
                  text: "The  ",
                ),
                TextSpan(
                    text: state.generatedChar.charClass.name,
                    style: AppTextStyle.selectButtonReady),
                const TextSpan(
                  text: "  of level  ",
                ),
                TextSpan(
                    text: "${state.generatedChar.charLevel}, ",
                    style: AppTextStyle.selectButtonReady),
                const TextSpan(
                  text: " named  ",
                ),
                TextSpan(
                    text: state.generatedChar.charName.fullName,
                    style: AppTextStyle.selectButtonReady),
                const TextSpan(
                  text: "  has no equipment so far.",
                ),
              ])),
        );
      }),
    );
  }
}
