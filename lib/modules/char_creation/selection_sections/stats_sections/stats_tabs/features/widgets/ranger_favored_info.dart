import 'package:flutter/material.dart';

import '../../../../../../../models/class_models/specials_model.dart';
import '../../../../../../../shared/constants/phone_sizes.dart';
import '../../../../../../../shared/themes/app_text_styles.dart';
import '../../../widgets/atribute_division.dart';

class RangerFavoredInfo extends StatelessWidget {
  final String label;
  final List<SpecialsModel> specials;
  final int enemyOrTerrainId;

  const RangerFavoredInfo({
    Key? key,
    required this.label,
    required this.specials,
    required this.enemyOrTerrainId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AttributeDivision(label: label),
        SizedBox(height: deviceHeight! * 0.005),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: specials
                .where((element) => element.levelAcquired == enemyOrTerrainId)
                .length,
            itemBuilder: (context, index) {
              var terrain = specials
                  .where((element) => element.levelAcquired == enemyOrTerrainId)
                  .toList()[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(terrain.name,
                    style: AppTextStyle.statsLabel
                        .copyWith(color: Colors.grey[400])),
              );
            }),
        SizedBox(height: deviceHeight! * 0.005),
      ],
    );
  }
}
