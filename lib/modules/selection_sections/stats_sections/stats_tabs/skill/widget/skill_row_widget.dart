import 'package:flutter/material.dart';

import '../../../../../../shared/constants/phone_sizes.dart';
import '../../../../../../shared/themes/app_text_styles.dart';

class SkillRowWidget extends StatelessWidget {
  final String bonus;
  final String skillName;
  final String atrb;
  final String pointAdded;
  final String armorPenalty;
  final double? skillWidth;
  final bool isNotLabel;

  const SkillRowWidget({
    Key? key,
    required this.bonus,
    required this.skillName,
    required this.atrb,
    required this.pointAdded,
    required this.armorPenalty,
    this.skillWidth,
    this.isNotLabel = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment:
              isNotLabel ? CrossAxisAlignment.center : CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: deviceWidth! * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  isNotLabel
                      ? SizedBox(
                          width: deviceWidth! * 0.15,
                          child: Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[900],
                              radius: 16,
                              child: Text(
                                bonus,
                                style: isNotLabel
                                    ? AppTextStyle.statsLabel
                                        .copyWith(color: Colors.grey[300])
                                    : AppTextStyle.statsLabel,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: deviceWidth! * 0.13,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              bonus,
                              style: AppTextStyle.statsLabel,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                  SizedBox(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        skillName,
                        style: isNotLabel
                            ? AppTextStyle.statsLabel
                                .copyWith(color: Colors.grey[300])
                            : AppTextStyle.statsLabel,
                        textAlign: TextAlign.center,
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
                  isNotLabel ? atrb.substring(0, 3) : atrb,
                  style: isNotLabel
                      ? AppTextStyle.statsLabel
                          .copyWith(color: Colors.grey[300])
                      : AppTextStyle.statsLabel,
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
                  style: isNotLabel
                      ? AppTextStyle.statsLabel
                          .copyWith(color: Colors.grey[300])
                      : AppTextStyle.statsLabel,
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
                  style: isNotLabel
                      ? AppTextStyle.statsLabel
                          .copyWith(color: Colors.grey[300])
                      : AppTextStyle.statsLabel,
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
