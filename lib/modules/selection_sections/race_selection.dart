import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:flutter/material.dart';

import 'widgets/race_list.dart';
import 'widgets/race_traits.dart';

class RaceSelection extends StatelessWidget {
  final Size size;
  final CharController state;
  const RaceSelection({
    Key? key,
    required this.size,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RaceList(
            onTap: () {
              state.updateChosenRace();
              state.advanceCreationStage();
            },
          ),
          RaceTraits(state: state, size: size)
        ],
      ),
    );
  }
}
