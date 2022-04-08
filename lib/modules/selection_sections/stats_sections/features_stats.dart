import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stats_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/widgets/atribute_division.dart';

import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/expanded_section.dart';

class FeatureStats extends StatelessWidget {
  const FeatureStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(builder: (context, state, child) {
      return ListView(
        children: [
          AtributeDivision(label: "${state.char.charClass.name} Features"),
          SizedBox(height: deviceHeight! * 0.005),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.traits.length,
              itemBuilder: (context, index) {
                var trait = state.traits[index];
                return FeatureList(
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
                return FeatureList(
                  name: special.name,
                  selected: special.isSelected,
                  description: special.description,
                  onTap: () => state.showDescriptions(index, state.specials),
                );
              }),
        ],
      );
    });
  }
}

// ignore: must_be_immutable
class FeatureList extends StatelessWidget {
  final String name;
  final String? focusOrSpecialization;
  bool selected;
  final VoidCallback onTap;
  final String description;
  FeatureList({
    Key? key,
    required this.name,
    this.focusOrSpecialization,
    required this.selected,
    required this.onTap,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            child: Row(
              children: [
                Text(name,
                    style: AppTextStyle.statsLabel
                        .copyWith(color: Colors.grey[400])),
                Text("  ${focusOrSpecialization}",
                    style: AppTextStyle.statsLabel
                        .copyWith(color: Colors.grey[400])),
                selected
                    ? const Icon(Icons.arrow_drop_down,
                        size: 25, color: Colors.blueGrey)
                    : const Icon(Icons.arrow_right,
                        size: 25, color: Colors.blueGrey),
              ],
            ),
            onTap: onTap),
        ExpandedSection(
          expand: selected,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: description, style: AppTextStyle.longDescription),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
