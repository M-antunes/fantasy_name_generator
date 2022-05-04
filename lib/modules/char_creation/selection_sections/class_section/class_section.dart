import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stage_controller/char_controller.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

import '../../../../shared/widgets/long_description_widget.dart';

class ClassSelection extends StatelessWidget {
  const ClassSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.maxFinite,
      child: Consumer<CharController>(
        builder: (context, state, child) {
          return Column(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: size.width * 0.2,
                      childAspectRatio: deviceWidth! < 350 ? 9 / 10 : 9 / 8,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 8),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.filteredClasses.length,
                  itemBuilder: (context, index) {
                    var charClass = state.filteredClasses[index];
                    return Column(
                      children: [
                        InkWell(
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  charClass.classIcon!,
                                  width: charClass.isSelected ? 55 : 50,
                                  height: charClass.isSelected ? 55 : 50,
                                  color: charClass.isSelected
                                      ? AppColors.primary
                                      : null,
                                ),
                                const SizedBox(height: 2),
                                Text(charClass.name,
                                    style: charClass.isSelected
                                        ? AppTextStyle.classSelected
                                        : AppTextStyle.classNotSelected)
                              ],
                            ),
                            onTap: () {
                              state.switchClass(charClass);
                            }),
                      ],
                    );
                  }),
              SizedBox(height: size.height * 0.02),
              LongDescriptionWidget(
                label: state.tempClassForSwitching.name,
                description: state.tempClassForSwitching.description!,
              )
            ],
          );
        },
      ),
    );
  }
}
