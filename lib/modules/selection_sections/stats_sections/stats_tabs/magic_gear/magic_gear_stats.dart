import 'package:fantasy_name_generator/controllers/stats_controller.dart';
import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/modules/selection_sections/stats_sections/widgets/atribute_division.dart';
import 'package:provider/provider.dart';

import '../../widgets/atribute_division.dart';
import '../../widgets/general_magical_equip_row.dart';

class MagicGearStats extends StatelessWidget {
  const MagicGearStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(builder: (context, state, child) {
      return ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const AtributeDivision(label: "Wonderous Items"),
          state.statsGenerated
              ? ListView.builder(
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
                  })
              : const Center(
                  child: Text(
                    "No item has been generated",
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                ),
        ],
      );
    });
  }
}
