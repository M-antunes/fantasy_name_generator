import 'package:flutter/material.dart';

import '../../../../../../../shared/constants/phone_sizes.dart';
import '../../../../../../../shared/themes/app_text_styles.dart';

class SkillRowLabelWidget extends StatelessWidget {
  const SkillRowLabelWidget({
    Key? key,
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
              width: deviceWidth! * 0.48,
              child: Row(
                children: [
                  SizedBox(
                    width: deviceWidth! * 0.1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Bonus",
                        style: AppTextStyle.skillClassLabel,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Text(
                    "Skill name",
                    style: AppTextStyle.skillClassLabel,
                  ),
                ],
              ),
            ),
            Text(
              "Atrbt",
              style: AppTextStyle.skillClassLabel,
              textAlign: TextAlign.center,
            ),
            Text(
              "Points\nAdded",
              style: AppTextStyle.skillClassLabel,
              textAlign: TextAlign.center,
            ),
            Text(
              "Boost",
              style: AppTextStyle.skillClassLabel,
              textAlign: TextAlign.center,
            ),
            Text(
              "Armor\npenalty",
              style: AppTextStyle.skillClassLabel,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(height: deviceHeight! * 0.005),
      ],
    );
  }
}
