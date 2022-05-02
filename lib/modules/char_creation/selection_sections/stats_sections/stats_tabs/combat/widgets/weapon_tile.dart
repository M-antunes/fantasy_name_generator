import 'package:flutter/material.dart';

import '../../../../../../../shared/themes/app_text_styles.dart';
import '../../../widgets/gradient_label.dart';

class WeaponTile extends StatelessWidget {
  final String type;
  final String? specificType;
  final String name;
  final String attack;
  final String damageValue;
  final String critical;
  final bool isOnCharSheet;
  const WeaponTile({
    Key? key,
    required this.type,
    this.specificType,
    required this.name,
    required this.attack,
    required this.damageValue,
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
        RichText(
            textScaleFactor: isOnCharSheet ? 0.8 : 1,
            strutStyle: const StrutStyle(height: 1.6),
            text: TextSpan(
                style:
                    AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300]),
                children: [
                  TextSpan(text: "Damage: ", style: AppTextStyle.statsLabel),
                  TextSpan(text: damageValue),
                  TextSpan(
                      text: "  Critical: ", style: AppTextStyle.statsLabel),
                  TextSpan(text: critical),
                ])),
      ],
    );
  }
}
