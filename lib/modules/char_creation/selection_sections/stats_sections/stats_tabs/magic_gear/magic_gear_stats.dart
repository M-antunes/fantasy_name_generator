import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stats_controller/stats_controller.dart';

import '../../../../../../shared/constants/phone_sizes.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../widgets/atribute_division.dart';
import '../../widgets/general_magical_equip_row.dart';
import '../../widgets/gradient_label.dart';
import 'widgets/spell_and_potion_description.dart';

class MagicGearStats extends StatelessWidget {
  const MagicGearStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(builder: (context, state, child) {
      return ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const AttributeDivision(label: "Wonderous Items"),
          !state.statsGenerated
              ? const Center()
              : state.char.charEquip.wonderousItems!.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "${state.char.charName.fullName} has no wonderous items",
                        style: AppTextStyle.statsLabel,
                      ),
                    )
                  : ListView.builder(
                      itemCount: state.char.charEquip.wonderousItems!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var item = state.char.charEquip.wonderousItems![index];
                        return GeneralMagicalEquipRow(
                            label: item.type!,
                            item: item.name!,
                            description: item.description!,
                            onTap: () => state.showDescriptions(
                                index, state.char.charEquip.wonderousItems!),
                            selected: item.isSelected);
                      }),
          state.statsGenerated && state.tomesAndManuals.isNotEmpty
              ? Column(
                  children: [
                    const GradientLabel(label: "Special Boosts"),
                    SizedBox(height: deviceHeight! * 0.006),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.tomesAndManuals.length,
                          itemBuilder: (context, index) {
                            var book = state.tomesAndManuals[index];
                            return GeneralMagicalEquipRow(
                              label: "Book read",
                              item: book.name!,
                              selected: book.isSelected,
                              description: book.description!,
                              onTap: () => state.showDescriptions(
                                  index, state.tomesAndManuals),
                            );
                          }),
                    )
                  ],
                )
              : const SizedBox(),
          SizedBox(height: deviceHeight! * 0.01),
          const AttributeDivision(label: "Potions"),
          !state.statsGenerated
              ? const Center()
              : state.charPotions.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "${state.char.charName.fullName} has no potions",
                        style: AppTextStyle.statsLabel,
                      ),
                    )
                  : ListView.builder(
                      itemCount: state.charPotions.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var potion = state.charPotions[index];
                        return InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: state.char.charLevel > 8 &&
                                    potion.name == "Aid" &&
                                    state.charPotions.first.name == "Aid"
                                ? RichText(
                                    text: TextSpan(children: [
                                    TextSpan(
                                      text: "Potion of ${potion.name}  ",
                                      style: AppTextStyle.statsLabelBrighter,
                                    ),
                                    TextSpan(
                                        text: "used for encounter",
                                        style: AppTextStyle.penaltyStyleText)
                                  ]))
                                : Text(
                                    "Potion of ${potion.name}",
                                    style: AppTextStyle.statsLabelBrighter,
                                  ),
                          ),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: ((context) =>
                                    SpellAndPotionDescription(potion: potion))),
                          ),
                        );
                      })
        ],
      );
    });
  }
}
