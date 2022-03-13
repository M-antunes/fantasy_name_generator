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
          Text(
            "Generate all weapons automatically according to what is preferable for the character's race and class",
            style: AppTextStyle.subTextGreyPlusSize,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: deviceHeight! * 0.02),
          AppGenerateButton(
            onGenerate: () {},
          ),
          SizedBox(height: deviceHeight! * 0.2),
          Text(
            "Click next to choose the types by yourself.",
            style: AppTextStyle.subTextGreyPlusSize,
          ),
        ],
      ),
    );
  }
}
