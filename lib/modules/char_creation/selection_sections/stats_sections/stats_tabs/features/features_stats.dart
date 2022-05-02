import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';
import 'package:fantasy_name_generator/controllers/stats_controller/stats_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';

import '../../widgets/atribute_division.dart';
import 'widgets/feature_list_widget.dart';
import 'widgets/ranger_favored_info.dart';

class FeatureStats extends StatelessWidget {
  const FeatureStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(builder: (context, state, child) {
      return ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          AttributeDivision(label: "${state.char.charClass.name} Features"),
          SizedBox(height: deviceHeight! * 0.005),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.traits.length,
              itemBuilder: (context, index) {
                var trait = state.traits[index];
                return FeatureListWidget(
                  name: trait.traiName,
                  selected: trait.isSelected,
                  description: trait.traiDescription,
                  onTap: () => state.showDescriptions(index, state.traits),
                );
              }),
          SizedBox(height: deviceHeight! * 0.005),
          state.specials.isNotEmpty &&
                  (state.char.charClass.name != "Ranger" &&
                      state.char.charClass.name != "Bandit")
              ? Column(
                  children: [
                    AttributeDivision(
                        label:
                            "${state.char.charClass.name}  ${state.char.charClass.specialName}"),
                    SizedBox(height: deviceHeight! * 0.005),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.specials.length,
                        itemBuilder: (context, index) {
                          var special = state.specials[index];
                          return FeatureListWidget(
                            name: special.name,
                            selected: special.isSelected,
                            description: special.description,
                            onTap: () =>
                                state.showDescriptions(index, state.specials),
                          );
                        }),
                    SizedBox(height: deviceHeight! * 0.05),
                  ],
                )
              : state.specials.isNotEmpty &&
                      (state.char.charClass.name == "Ranger" ||
                          state.char.charClass.name == "Bandit")
                  ? Column(
                      children: [
                        RangerFavoredInfo(
                            label: state.char.charClass.name == "Bandit"
                                ? "Favored Prey"
                                : "Favored Enemies",
                            specials: state.specials,
                            enemyOrTerrainId: 0),
                        RangerFavoredInfo(
                            label: "Favored Terrains",
                            specials: state.specials,
                            enemyOrTerrainId: 1),
                      ],
                    )
                  : const SizedBox(),
        ],
      );
    });
  }
}
