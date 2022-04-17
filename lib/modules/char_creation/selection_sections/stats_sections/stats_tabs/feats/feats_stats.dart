import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../controllers/stats_controller/stats_controller.dart';
import '../../../../../../shared/constants/phone_sizes.dart';
import '../../widgets/atribute_division.dart';
import 'widgets/feat_list_widget.dart';

class FeatStats extends StatelessWidget {
  const FeatStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(
      builder: (context, state, child) {
        return ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const AttributeDivision(label: "Feats"),
            SizedBox(height: deviceHeight! * 0.005),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.charFeats.length,
                itemBuilder: (context, index) {
                  var feat = state.charFeats[index];
                  return FeatListWidget(
                    name: feat.traiName,
                    focusOrSpecialization: (feat.traiName != "Weapon Focus" &&
                            feat.traiName != "Weapon Specialization" &&
                            feat.traiName != "Greater Weapon Focus" &&
                            feat.traiName != "Greater Weapon Specialization" &&
                            feat.traiName != "Weapon Finesse")
                        ? ""
                        : state.char.physicalStyle.name == "Bowman" ||
                                state.char.physicalStyle.name == "Marksman" ||
                                state.char.physicalStyle.name == "Thrower"
                            ? "(${state.char.charEquip.rangeWeapon!.name})"
                            : "(${state.char.charEquip.meleeWeapon!.name})",
                    selected: feat.isSelected,
                    description: feat.traiDescription,
                    onTap: () => state.showDescriptions(index, state.charFeats),
                  );
                }),
          ],
        );
      },
    );
  }
}
