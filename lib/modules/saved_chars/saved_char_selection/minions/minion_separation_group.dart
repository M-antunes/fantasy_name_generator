import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';

import '../../../../shared/routes/app_roues.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/expanded_section.dart';
import 'saved_minion_tile.dart';

class MinionSeparationGroup extends StatelessWidget {
  final String className;
  final int numberOfChars;
  final bool isSelected;
  final CharModel char;
  const MinionSeparationGroup({
    Key? key,
    required this.className,
    required this.numberOfChars,
    required this.isSelected,
    required this.char,
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
                  itemCount: numberOfChars,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SavedMinionTile(
                      level: char.charLevel,
                      charName: char.charName.fullName,
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.savedCharSheet, arguments: char),
                    );
                  }))
        ],
      ),
    );
  }
}
