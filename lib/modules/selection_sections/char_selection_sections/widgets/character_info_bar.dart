import 'package:flutter/material.dart';

import '../../../../shared/themes/app_text_styles.dart';

class CharacterInfoBar extends StatelessWidget {
  final String race;
  final String className;
  const CharacterInfoBar({
    Key? key,
    required this.race,
    required this.className,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(race, style: AppTextStyle.subTextGreyPlusSize),
          Text(className, style: AppTextStyle.subTextGreyPlusSize),
        ],
      ),
    );
  }
}
