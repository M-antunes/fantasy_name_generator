import 'package:flutter/material.dart';

import '../../../../shared/themes/app_text_styles.dart';

class CharacterInfoBar extends StatelessWidget {
  final String race;
  final String className;
  final String gender;
  const CharacterInfoBar({
    Key? key,
    required this.race,
    required this.className,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(gender, style: AppTextStyle.subTextGrey),
              const SizedBox(width: 8),
              Text(race, style: AppTextStyle.subTextGreyPlusSize),
            ],
          ),
          Text(className, style: AppTextStyle.subTextGreyPlusSize),
        ],
      ),
    );
  }
}
