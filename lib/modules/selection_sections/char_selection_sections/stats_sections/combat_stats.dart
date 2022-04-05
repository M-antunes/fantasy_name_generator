import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/shared/widgets/atribute_division.dart';

import '../../../../controllers/char_controller.dart';
import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../widgets/char_description_column.dart';
import '../widgets/defense_info.dart';

class CombatStats extends StatelessWidget {
  const CombatStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CharController>(builder: (context, state, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AtributeDivision(label: "Defense"),
          DefenseInfo(
            length: deviceWidth! * 0.35,
            label: "Hit Points:",
            value: "${state.cha.hitPoints}",
          ),
          const SizedBox(height: 3),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text("Shield name", style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 4),
                      Text("+magic", style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 10),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text("Armor name", style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 4),
                      Text("+magic", style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
              DefenseInfo(
                label: "Armor Class:",
                value: "0",
                length: deviceWidth! * 0.3,
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: const [
              DefenseInfo(label: "Touch:", value: "0"),
              SizedBox(width: 15),
              DefenseInfo(label: "Surprise:", value: "0"),
            ],
          ),
          const GradientLabel(label: "Resistances"),
          Row(
            children: [
              DefenseInfo(
                label: "Fortitude:",
                value: "${state.cha.resistances.fortitude!}",
              ),
              SizedBox(width: deviceWidth! * 0.03),
              DefenseInfo(
                label: "Reflex:",
                value: "${state.cha.resistances.reflex!}",
              ),
              SizedBox(width: deviceWidth! * 0.03),
              DefenseInfo(
                label: "Will:",
                value: "${state.cha.resistances.will!}",
              ),
            ],
          ),
          const AtributeDivision(label: "Offense"),
          Row(
            children: [
              DefenseInfo(
                label: "Initiative:",
                value: "${state.cha.resistances.will!}",
              ),
              SizedBox(width: deviceWidth! * 0.03),
              DefenseInfo(
                label: "Speed:",
                value: "${state.cha.resistances.will!}",
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              const CharDescriptionText(
                  label: "Base attack bonus:", textValue: "0"),
              SizedBox(width: deviceWidth! * 0.05),
              DefenseInfo(
                length: deviceWidth! * 0.2,
                label: "CMB:",
                value: "0",
              ),
              DefenseInfo(
                length: deviceWidth! * 0.2,
                label: "CMD",
                value: "0",
              ),
            ],
          ),
          const SizedBox(height: 3),
          const GradientLabel(label: "Melee"),
          const SizedBox(height: 3),
          Row(
            children: [
              Text("Weapon name", style: AppTextStyle.subTextWhite),
              const SizedBox(width: 4),
              Text("+magic ", style: AppTextStyle.subTextWhite),
              const SizedBox(width: 4),
              Text("+attack ", style: AppTextStyle.subTextWhite),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Text("Damage:", style: AppTextStyle.subTextGrey),
              const SizedBox(width: 4),
              Text("value ", style: AppTextStyle.subTextWhite),
              const SizedBox(width: 4),
              Text("+bonus ", style: AppTextStyle.subTextWhite),
            ],
          ),
          const SizedBox(height: 3),
          const GradientLabel(label: "Range"),
          Row(
            children: [
              Text("Weapon name", style: AppTextStyle.subTextWhite),
              const SizedBox(width: 4),
              Text("+magic ", style: AppTextStyle.subTextWhite),
              const SizedBox(width: 4),
              Text("+attack ", style: AppTextStyle.subTextWhite),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Text("Damage:", style: AppTextStyle.subTextGrey),
              const SizedBox(width: 4),
              Text("value ", style: AppTextStyle.subTextWhite),
              const SizedBox(width: 4),
              Text("+bonus ", style: AppTextStyle.subTextWhite),
            ],
          ),
        ],
      );
    });
  }
}

class GradientLabel extends StatelessWidget {
  final String label;
  const GradientLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey[900]!,
              Colors.transparent,
            ],
          ),
        ),
        padding: const EdgeInsets.all(2),
        child: Text(" $label",
            style: AppTextStyle.selectRace.copyWith(color: Colors.grey[400])));
  }
}
