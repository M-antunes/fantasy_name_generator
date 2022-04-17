import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stats_controller/stats_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';

import '../../widgets/atribute_division.dart';
import 'widgets/feature_list_widget.dart';

class FeatureStats extends StatelessWidget {
  const FeatureStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(builder: (context, state, child) {
      return ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          AtributeDivision(label: "${state.char.charClass.name} Features"),
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
          AtributeDivision(
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
                  onTap: () => state.showDescriptions(index, state.specials),
                );
              }),
          SizedBox(height: deviceHeight! * 0.05),
        ],
      );
    });
  }
}
