import 'package:flutter/material.dart';

import 'segments/defense_segment.dart';
import 'segments/offense_segment.dart';

class CombatStats extends StatelessWidget {
  const CombatStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DefenseSegment(),
            OffenseSegment(),
          ],
        ),
      ],
    );
  }
}
