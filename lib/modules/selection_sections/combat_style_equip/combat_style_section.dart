import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

import '../widgets/long_description_widget.dart';

class CombatStyleSection extends StatelessWidget {
  const CombatStyleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CharController>(builder: (context, state, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: deviceHeight! * 0.06),
          Text(
            "Select a combat style for",
            style: AppTextStyle.subTextGrey,
          ),
          const SizedBox(height: 4),
          Text(
            "${state.newName} ${state.newLastName}",
            style: AppTextStyle.subTextGreyPlusSize,
          ),
          SizedBox(height: deviceHeight! * 0.05),
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.3 / 2,
              ),
              itemCount: state.listOfClasses.combatStyles.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var combatStyle = state.listOfClasses.combatStyles[index];
                return Column(
                  children: [
                    Text(combatStyle.name,
                        style: combatStyle.isSelected
                            ? AppTextStyle.subTextRed
                            : AppTextStyle.subTextWhite),
                    InkWell(
                      onTap: () => state.switchCombatStyle(combatStyle),
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          padding: EdgeInsets.all(deviceWidth! < 400 ? 10 : 15),
                          child: SvgPicture.asset(combatStyle.svg,
                              height: deviceWidth! < 400 ? 45 : 55,
                              color: combatStyle.isSelected
                                  ? AppColors.primary
                                  : null),
                        ),
                      ),
                    ),
                    SizedBox(height: deviceHeight! * 0.05),
                  ],
                );
              }),
          LongDescriptionWidget(
              label: state.tempStyleForSwitching.descriptionTitle,
              description: state.tempStyleForSwitching.description),
        ],
      );
    });
  }
}
