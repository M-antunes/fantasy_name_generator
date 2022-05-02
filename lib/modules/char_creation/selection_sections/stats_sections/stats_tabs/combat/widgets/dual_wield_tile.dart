import 'package:flutter/material.dart';

import '../../../../../../../shared/themes/app_text_styles.dart';
import '../../../widgets/gradient_label.dart';

class DualWieldTile extends StatelessWidget {
  final String weapons;
  final String attack;
  final String damage;
  final String critical;
  final bool isOnCharSheet;
  const DualWieldTile({
    Key? key,
    required this.weapons,
    required this.attack,
    required this.damage,
    required this.critical,
    this.isOnCharSheet = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GradientLabel(label: "Dual-wield fight"),
        RichText(
            textScaleFactor: isOnCharSheet ? 0.8 : 1,
            text: TextSpan(children: [
              TextSpan(
                text: "Weapons: ",
                style: AppTextStyle.statsLabel,
              ),
              TextSpan(
                text: weapons,
                style:
                    AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300]),
              ),
            ])),
        const SizedBox(height: 3),
        RichText(
            textScaleFactor: isOnCharSheet ? 0.8 : 1,
            text: TextSpan(children: [
              TextSpan(
                text: "Attack bonus: ",
                style: AppTextStyle.statsLabel,
              ),
              TextSpan(
                text: attack,
                style:
                    AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300]),
              ),
            ])),
        const SizedBox(height: 3),
        RichText(
            textScaleFactor: isOnCharSheet ? 0.8 : 1,
            text: TextSpan(children: [
              TextSpan(
                text: "Damage: ",
                style: AppTextStyle.statsLabel,
              ),
              TextSpan(
                text: damage,
                style:
                    AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300]),
              ),
            ])),
        const SizedBox(height: 3),
        RichText(
            textScaleFactor: isOnCharSheet ? 0.8 : 1,
            text: TextSpan(children: [
              TextSpan(
                text: "Critical: ",
                style: AppTextStyle.statsLabel,
              ),
              TextSpan(
                text: critical,
                style:
                    AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300]),
              ),
            ])),
        const SizedBox(height: 3),
      ],
    );
  }
}
