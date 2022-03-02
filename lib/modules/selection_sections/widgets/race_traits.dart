import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class RaceTraits extends StatelessWidget {
  final CharController state;
  final Size size;

  const RaceTraits({
    Key? key,
    required this.state,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${state.tempRaceForSwitching.name} Traits"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Container(
            width: size.width * 0.45,
            height: size.height * 0.003,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          width: size.width * 0.5,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "  Value:  ", style: AppTextStyle.traitValue),
                TextSpan(
                    text: "fuhufhufhu fhfhuhf fuhhfuhfu iudsuhuhsu",
                    style: AppTextStyle.traitDescription),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
