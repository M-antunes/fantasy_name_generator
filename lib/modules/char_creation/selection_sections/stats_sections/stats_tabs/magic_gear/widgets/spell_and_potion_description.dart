import 'package:flutter/material.dart';

import '../../../../../../../models/spell_models/spell_model.dart';
import '../../../../../../../shared/themes/app_text_styles.dart';
import '../../../widgets/gradient_label.dart';

class SpellAndPotionDescription extends StatelessWidget {
  final SpellModel potion;
  const SpellAndPotionDescription({
    Key? key,
    required this.potion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GradientLabel(label: potion.name),
                  SpellOrPotionInfoText(label: "School ", info: potion.school),
                  SpellOrPotionInfoText(
                      label: "Spell level ", info: "${potion.level}"),
                  SpellOrPotionInfoText(
                      label: "Casting time  ", info: potion.castingTime),
                  SpellOrPotionInfoText(
                      label: "Caster level  ", info: "${potion.conjurerLevel}"),
                  SpellOrPotionInfoText(label: "Range  ", info: potion.range),
                  SpellOrPotionInfoText(
                      label: "Area / target / effect  ", info: potion.target),
                  SpellOrPotionInfoText(
                      label: "Duration  ", info: potion.duration),
                  SpellOrPotionInfoText(
                      label: "Saving Throw  ", info: potion.savingThrow),
                  SpellOrPotionInfoText(
                      label: "Spell Resistance  ",
                      info: potion.spellResistance),
                  SpellOrPotionInfoText(
                      label: "Description   ",
                      isDescription: true,
                      info: potion.effect),
                ],
              ),
            ),
            InkWell(
                child: const Chip(label: Text("Back")),
                onTap: () => Navigator.of(context).pop()),
          ],
        ),
      ),
    );
  }
}

class SpellOrPotionInfoText extends StatelessWidget {
  final String label;
  final String info;
  final bool isDescription;
  const SpellOrPotionInfoText({
    Key? key,
    required this.label,
    required this.info,
    this.isDescription = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: label,
            style: AppTextStyle.statsValue.copyWith(color: Colors.grey[300])),
        TextSpan(
            text: info,
            style: isDescription
                ? AppTextStyle.longDescription
                : AppTextStyle.statsLabel),
      ])),
    );
  }
}
