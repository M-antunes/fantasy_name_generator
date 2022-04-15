import 'package:flutter/material.dart';

import '../../../../shared/routes/app_roues.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/expanded_section.dart';
import 'saved_boos_tile.dart';

class BossSeparationGroup extends StatelessWidget {
  final String className;
  final int numberOfChars;
  final bool isSelected;
  const BossSeparationGroup({
    Key? key,
    required this.className,
    required this.numberOfChars,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Chip(
              elevation: 10,
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(className,
                      style: AppTextStyle.legendaryLabel.copyWith(
                          color: AppColors.primaryText, fontSize: 26)),
                  CircleAvatar(
                    radius: 14,
                    child: Text(
                      "$numberOfChars",
                      style: AppTextStyle.subTextWhitePlusSize,
                    ),
                  ),
                ],
              )),
          ExpandedSection(
              expand: true,
              child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SavedBossTile(
                      level: 11,
                      charName: "Example 2",
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.savedCharSheet),
                    );
                  }))
        ],
      ),
    );
  }
}
