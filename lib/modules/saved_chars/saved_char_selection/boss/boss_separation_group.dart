import 'package:flutter/material.dart';

import '../../../../models/char_personal_models/char_model.dart';
import '../../../../shared/routes/app_roues.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/expanded_section.dart';
import 'saved_boss_tile.dart';

class BossGroups extends StatelessWidget {
  final bool isSelected;
  final String storedClass;
  final int characterQnt;
  final List<CharModel> classList;
  final VoidCallback onTap;
  const BossGroups({
    Key? key,
    this.isSelected = false,
    required this.storedClass,
    required this.characterQnt,
    required this.classList,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Chip(
                elevation: 10,
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(storedClass,
                        style: AppTextStyle.legendaryLabel.copyWith(
                            color: AppColors.primaryText, fontSize: 26)),
                    CircleAvatar(
                      radius: 14,
                      child: Text(
                        "$characterQnt",
                        style: AppTextStyle.subTextWhitePlusSize,
                      ),
                    ),
                  ],
                )),
            ExpandedSection(
                expand: isSelected,
                child: ListView.builder(
                    itemCount: characterQnt,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var char = classList[index];
                      return SavedBossTile(
                        level: char.charLevel,
                        svg: char.physicalStyle.svg,
                        charName: char.charName.fullName,
                        alignment: char.alignment.name,
                        race: char.charRace.name,
                        gender: char.charName.gender,
                        onTap: () => Navigator.of(context).pushNamed(
                            AppRoutes.savedCharSheet,
                            arguments: char),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
