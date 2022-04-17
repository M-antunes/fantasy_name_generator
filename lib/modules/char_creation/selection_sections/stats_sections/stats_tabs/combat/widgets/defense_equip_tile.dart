import 'package:flutter/material.dart';

import '../../../../../../../shared/themes/app_text_styles.dart';

class DefenseEquipTile extends StatelessWidget {
  final String label;
  final String name;
  final String? magic;
  final bool isMasterWork;
  const DefenseEquipTile({
    Key? key,
    required this.label,
    required this.name,
    this.magic,
    this.isMasterWork = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: AppTextStyle.statsLabel),
        const SizedBox(width: 4),
        Text(name,
            style: AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300])),
        const SizedBox(width: 4),
        Text(isMasterWork ? "(mw)" : "",
            style: AppTextStyle.statsLabel.copyWith(
                color: Colors.grey[400], fontStyle: FontStyle.italic)),
        Text(magic ?? "",
            style: AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300])),
        const SizedBox(width: 10),
      ],
    );
  }
}
