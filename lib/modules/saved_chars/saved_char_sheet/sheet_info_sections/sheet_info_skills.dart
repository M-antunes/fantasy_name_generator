import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/sheet_info_sections/widgets/gradient_label_sheet.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/app_horizontal_line.dart';
import '../../../../shared/widgets/expanded_section.dart';

class SheetInfoSkills extends StatelessWidget {
  const SheetInfoSkills({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandedSection(
      expand: true,
      child: Column(
        children: [
          const GradientLabelSheet(label: "Skills"),
          SizedBox(height: deviceHeight! * 0.003),
          SizedBox(height: deviceHeight! * 0.005),
          const AppHorizontalLine(),
          SizedBox(height: deviceHeight! * 0.004),
          Row(
            children: [
              SizedBox(
                width: deviceWidth! * 0.11,
                child: Text(
                  "Bonus",
                  style: AppTextStyle.longDescription,
                ),
              ),
              SizedBox(
                  width: deviceWidth! * 0.3,
                  child: ListTile(
                      title: Text(
                    "Name of the skill",
                    style: AppTextStyle.longDescription,
                  ))),
              SizedBox(
                  width: deviceWidth! * 0.12,
                  child: Text(
                    "Added\nPoints",
                    style: AppTextStyle.longDescription,
                  )),
              SizedBox(
                  width: deviceWidth! * 0.1,
                  child: Text(
                    "Atrb",
                    style: AppTextStyle.longDescription,
                  )),
              SizedBox(
                  width: deviceWidth! * 0.13,
                  child: Text(
                    "Armor\nPenalty",
                    style: AppTextStyle.longDescription,
                  )),
            ],
          ),
          const AppHorizontalLine(),
          SizedBox(
            height: deviceHeight! * 0.6,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(
                            width: deviceWidth! * 0.08,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[900],
                              radius: 16,
                              child: Text(
                                "10",
                                style: AppTextStyle.statsLabelBrighter,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                              width: deviceWidth! * 0.4,
                              child: ListTile(
                                  title: Text(
                                      "Name of the damn skill might be big"))),
                          SizedBox(
                              width: deviceWidth! * 0.05,
                              child: Text(
                                "0",
                                style: AppTextStyle.longDescription,
                                textAlign: TextAlign.left,
                              )),
                          SizedBox(
                              width: deviceWidth! * 0.1,
                              child: Text(
                                "dex 0",
                                style: AppTextStyle.longDescription,
                                textAlign: TextAlign.left,
                              )),
                          SizedBox(
                              width: deviceWidth! * 0.1,
                              child: Text(
                                "0",
                                style: AppTextStyle.longDescription,
                                textAlign: TextAlign.center,
                              )),
                        ],
                      );
                    }),
                SizedBox(height: deviceHeight! * 0.004),
                const AppHorizontalLine(),
                SizedBox(height: deviceHeight! * 0.002),
                RichText(
                    textScaleFactor: 0.9,
                    text: TextSpan(
                        style: AppTextStyle.longDescription
                            .copyWith(fontStyle: FontStyle.italic),
                        children: const [
                          TextSpan(
                              text:
                                  "* Bigger font means those are favored class skills and have been granted 3 aditional points from start.")
                        ])),
                SizedBox(height: deviceHeight! * 0.004),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
