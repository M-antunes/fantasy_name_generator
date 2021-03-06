import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../shared/constants/phone_sizes.dart';
import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_text_styles.dart';

class CombatEquipSection extends StatelessWidget {
  const CombatEquipSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CharController>(builder: (context, state, child) {
      var possibleWeapons = state.listOfClasses.physicalStyles
          .where((element) =>
              !element.forbiddenClasses.contains(state.chosenClass.name))
          .toList();
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              "Select a ${state.chosenStyle.descriptionTitle} for",
              style: AppTextStyle.subTextGrey,
            ),
            SizedBox(height: deviceHeight! * 0.01),
            Text(
              "${state.newName} ${state.newLastName}",
              style: AppTextStyle.subTextWhite,
            ),
            SizedBox(height: deviceHeight! * 0.03),
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1,
                ),
                itemCount: possibleWeapons.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var style = possibleWeapons[index];
                  return Column(
                    children: [
                      Text(style.name,
                          style: style.isSelected
                              ? AppTextStyle.subTextRed
                              : AppTextStyle.subTextWhite),
                      InkWell(
                        onTap: () => state.switchPhysicalStyle(style),
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Container(
                            padding:
                                EdgeInsets.all(deviceWidth! < 400 ? 10 : 15),
                            child: SvgPicture.asset(style.svg,
                                height: deviceWidth! < 400 ? 40 : 50,
                                color: style.isSelected
                                    ? AppColors.primary
                                    : null),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      );
    });
  }
}
