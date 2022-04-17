import 'package:flutter/material.dart';

import '../../../../../../../shared/constants/phone_sizes.dart';
import '../../../../../../../shared/themes/app_text_styles.dart';

class SkillRowLabelWidget extends StatelessWidget {
  final String bonus;
  final String skillName;
  final String atrb;
  final String pointAdded;
  final String armorPenalty;
  final double? skillWidth;

  const SkillRowLabelWidget({
    Key? key,
    required this.bonus,
    required this.skillName,
    required this.atrb,
    required this.pointAdded,
    required this.armorPenalty,
    this.skillWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: deviceWidth! * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: deviceWidth! * 0.13,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        bonus,
                        style: AppTextStyle.skillClassLabel,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        skillName,
                        style: AppTextStyle.skillClassLabel,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: deviceWidth! * 0.12,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  atrb,
                  style: AppTextStyle.skillClassLabel,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              width: deviceWidth! * 0.13,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  pointAdded,
                  style: AppTextStyle.skillClassLabel,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              width: deviceWidth! * 0.13,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  armorPenalty,
                  style: AppTextStyle.skillClassLabel,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: deviceHeight! * 0.005),
      ],
    );
  }
}
