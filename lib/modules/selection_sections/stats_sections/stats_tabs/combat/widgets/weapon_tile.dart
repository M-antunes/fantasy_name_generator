import 'package:flutter/material.dart';

import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../widgets/gradient_label.dart';

class WeaponTile extends StatelessWidget {
  final String type;
  final String? specificType;
  final String name;
  final String magic;
  final String effect;
  final bool isMasterWork;
  final String attack;
  final String damageValue;
  final String damageBonus;
  final String? extraDamage;
  const WeaponTile({
    Key? key,
    required this.type,
    this.specificType,
    required this.name,
    required this.magic,
    required this.effect,
    this.isMasterWork = false,
    required this.attack,
    required this.damageValue,
    required this.damageBonus,
    this.extraDamage,
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
              TextSpan(
                  text: effect != "" ? "$effect  " : "",
                  style: const TextStyle(fontStyle: FontStyle.italic)),
              TextSpan(text: "$name  "),
              TextSpan(
                  text: isMasterWork ? "(mw)  " : "",
                  style: AppTextStyle.statsLabel.copyWith(
                      color: Colors.grey[400], fontStyle: FontStyle.italic)),
              TextSpan(text: magic != "" ? "$magic  " : ""),
              TextSpan(text: attack),
            ])),
        const SizedBox(height: 3),
        Row(
          children: [
            Text("Damage:", style: AppTextStyle.statsLabel),
            const SizedBox(width: 4),
            Text(damageValue,
                style: AppTextStyle.subTextWhite
                    .copyWith(color: Colors.grey[300])),
            const SizedBox(width: 4),
            Text(damageBonus,
                style: AppTextStyle.subTextWhite
                    .copyWith(color: Colors.grey[300])),
            const SizedBox(width: 4),
            Text(extraDamage ?? "",
                style: AppTextStyle.subTextWhite
                    .copyWith(color: Colors.grey[300])),
          ],
        ),
      ],
    );
  }
}
