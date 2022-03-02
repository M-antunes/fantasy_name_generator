import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/advance_button.dart';
import 'widgets/race_list.dart';
import 'widgets/race_traits.dart';

class RaceSelection extends StatelessWidget {
  const RaceSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<CharController>(builder: (context, state, child) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RaceList(
                  onTap: () => state.updateChosenRace(),
                ),
                RaceTraits(),
              ],
            ),
          ),
          AdvanceButton(
            size: size,
            onTap: () => state.advanceCreationStage(),
          ),
        ],
      );
    });
  }
}
