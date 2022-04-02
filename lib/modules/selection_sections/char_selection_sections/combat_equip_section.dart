import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CombatEquipSection extends StatelessWidget {
  const CombatEquipSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CharController>(builder: (context, state, child) {
      return Column(
        children: [
          Text("Select and confirm ${state.chosenStyle.descriptionTitle}")
        ],
      );
    });
  }
}
