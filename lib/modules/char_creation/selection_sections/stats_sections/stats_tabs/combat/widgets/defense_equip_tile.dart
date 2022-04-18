import 'package:flutter/material.dart';

import '../../../../../../../shared/themes/app_text_styles.dart';

class DefenseEquipTile extends StatelessWidget {
  final String label;
  final String name;
  const DefenseEquipTile({
    Key? key,
    required this.label,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: AppTextStyle.statsLabel),
        const SizedBox(width: 4),
        Text(name,
            style: AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300])),
      ],
    );
  }
}
