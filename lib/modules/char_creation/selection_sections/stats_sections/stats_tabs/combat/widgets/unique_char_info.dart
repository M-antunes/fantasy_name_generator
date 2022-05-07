import 'package:flutter/material.dart';

import '../../../../../../../models/class_models/traits_model.dart';
import '../../../../../../../shared/constants/phone_sizes.dart';
import 'combat_info.dart';

class UniqueCharInfo extends StatelessWidget {
  final List<TraitModel> traits;
  final String label;
  final int stringIndex;
  const UniqueCharInfo({
    Key? key,
    required this.traits,
    required this.label,
    required this.stringIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 3),
        CombatInfo(
          length: deviceWidth! * 0.5,
          label: label,
          value: traits
              .firstWhere((element) => element.traiName.contains(label))
              .traiName
              .substring(stringIndex),
        ),
      ],
    );
  }
}
