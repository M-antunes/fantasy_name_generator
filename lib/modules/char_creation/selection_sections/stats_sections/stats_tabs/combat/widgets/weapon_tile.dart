import 'package:flutter/material.dart';

import '../../../../../../../shared/themes/app_text_styles.dart';
import '../../../widgets/gradient_label.dart';

class WeaponTile extends StatelessWidget {
  final String type;
  final String? specificType;
  final String name;
  final String attack;
  final String damageValue;
  final String damageBonus;
  final String? extraDamage;
  final String critical;
  final bool isOnCharSheet;
  const WeaponTile({
    Key? key,
    required this.type,
    this.specificType,
    required this.name,
    required this.attack,
    required this.damageValue,
    required this.damageBonus,
    this.extraDamage,
    required this.critical,
    this.isOnCharSheet = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientLabel(label: type, label2: specificType),
        RichText(
            text: TextSpan(
                style:
                    AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300]),
                children: [
              TextSpan(text: "$name  "),
              TextSpan(text: attack),
            ])),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              "Damage:",
              style: AppTextStyle.statsLabel,
              textScaleFactor: isOnCharSheet ? 0.8 : 1,
            ),
            const SizedBox(width: 4),
            Text(
              damageValue,
              style:
                  AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300]),
              textScaleFactor: isOnCharSheet ? 0.8 : 1,
            ),
            const SizedBox(width: 4),
            Text(
              damageBonus,
              style:
                  AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300]),
              textScaleFactor: isOnCharSheet ? 0.8 : 1,
            ),
            const SizedBox(width: 4),
            Text(
              extraDamage ?? "",
              style:
                  AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300]),
              textScaleFactor: isOnCharSheet ? 0.8 : 1,
            ),
            const SizedBox(width: 10),
            Text(
              "Critical:",
              style: AppTextStyle.statsLabel,
              textScaleFactor: isOnCharSheet ? 0.8 : 0.9,
            ),
            const SizedBox(width: 4),
            Text(
              critical,
              style:
                  AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300]),
              textScaleFactor: isOnCharSheet ? 0.8 : 0.9,
            ),
            // const SizedBox(height: 3),
          ],
        ),
      ],
    );
  }
}
