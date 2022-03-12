import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:fantasy_name_generator/shared/widgets/app_generate_button.dart';
import 'package:flutter/material.dart';

class WeaponChoice extends StatelessWidget {
  const WeaponChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(height: deviceHeight! * 0.15),
          RichText(
            strutStyle: const StrutStyle(height: 1.8),
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTextStyle.subTextGreyPlusSize,
              children: [
                const TextSpan(
                    text:
                        "You can either choose the weapons you want by clicking "),
                TextSpan(
                    text: "next", style: AppTextStyle.subTextWhitePlusSize),
                const TextSpan(text: " or you can click on the "),
                TextSpan(
                    text: "Generate Button ",
                    style: AppTextStyle.subTextWhitePlusSize),
                const TextSpan(
                  text:
                      "and have them automatically assigned to you character.\n(based on your the class and race you chose)",
                ),
              ],
            ),
          ),
          SizedBox(height: deviceHeight! * 0.1),
          AppGenerateButton(
            onGenerate: () {},
          ),
        ],
      ),
    );
  }
}
