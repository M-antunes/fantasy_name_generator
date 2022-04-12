import 'package:fantasy_name_generator/controllers/stats_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/widgets/atribute_division.dart';
import '../widgets/stats_description_column.dart';
import 'combat_stats.dart';
import 'widgets/general_magical_equip_row.dart';

class AbilityScoreSection extends StatelessWidget {
  const AbilityScoreSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(builder: (context, state, child) {
      return ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AtributeDivision(
                label: "Ability Scores  (base / modifier)",
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: deviceWidth! * 0.44,
                        child: StatsDescriptionColumn(
                          labeltop: "Strength:",
                          labelBottom: "Dexterity:",
                          textValueTop: state.char.baseAtributes.strength,
                          textValueBottom: state.char.baseAtributes.dexterity,
                          modTop: state.char.modAtributes.strength,
                          modBottom: state.char.modAtributes.dexterity,
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth! * 0.44,
                        child: StatsDescriptionText(
                          label: "Constitution:",
                          textValue: state.char.baseAtributes.constitution,
                          modValue: state.char.modAtributes.constitution,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: deviceWidth! * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: deviceWidth! * 0.44,
                        child: StatsDescriptionColumn(
                          labeltop: "Intelligence:",
                          labelBottom: "Wisdom:",
                          textValueTop: state.char.baseAtributes.intelligence,
                          textValueBottom: state.char.baseAtributes.wisdom,
                          modTop: state.char.modAtributes.intelligence,
                          modBottom: state.char.modAtributes.wisdom,
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth! * 0.44,
                        child: StatsDescriptionText(
                          label: "Charisma:",
                          textValue: state.char.baseAtributes.charisma,
                          modValue: state.char.modAtributes.charisma,
                        ),
                      ),
                      SizedBox(height: deviceHeight! * 0.006),
                    ],
                  ),
                ],
              ),
              SizedBox(height: deviceHeight! * 0.03),
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
            ],
          ),
        ],
      );
    });
  }
}
