import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/stage_controller/char_controller.dart';
import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/long_description_widget.dart';

class SpellcasterStyleSection extends StatelessWidget {
  const SpellcasterStyleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CharController>(builder: (context, state, child) {
      return SizedBox(
        height: deviceHeight! * 0.8,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: deviceHeight! * 0.03),
            Center(
              child: Text(
                "50% of ${state.isMale ? "his" : "her"} spells will be of the school choosen.",
                style: AppTextStyle.subTextGrey,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: deviceHeight! * 0.03),
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.8 / 1,
                ),
                itemCount: state.listOfSchoolsOfMagic.listOfSchools.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var school = state.listOfSchoolsOfMagic.listOfSchools[index];
                  return Column(
                    children: [
                      Text(
                        school.name,
                        style: school.isSelected
                            ? AppTextStyle.subTextRed
                            : AppTextStyle.subTextWhite,
                        textScaleFactor: 0.85,
                      ),
                      InkWell(
                        onTap: () => state.switchSchool(school),
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Container(
                            padding:
                                EdgeInsets.all(deviceWidth! < 400 ? 10 : 15),
                            child: SvgPicture.asset(school.svg,
                                height: deviceWidth! < 400 ? 40 : 50,
                                color: school.isSelected
                                    ? AppColors.primary
                                    : null),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
            LongDescriptionWidget(
                label: state.schoolChoice.name,
                description: state.schoolChoice.description),
          ],
        ),
      );
    });
  }
}
