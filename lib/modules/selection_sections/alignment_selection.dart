import 'package:fantasy_name_generator/models/alignment_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';

import 'widgets/advance_button.dart';

class AlignmentSelection extends StatelessWidget {
  final VoidCallback onTap;
  const AlignmentSelection({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.maxFinite,
      child: Consumer<CharController>(builder: (context, state, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(state.chosenClass.name == "Barbarian"
                  ? "Barbarians CANNOT be Lawful"
                  : state.chosenClass.name == "Rogue"
                      ? "Rogues CANNOT be Lawful"
                      : state.chosenClass.name == "Paladin"
                          ? "Paladins CAN ONLY be Lawful"
                          : state.chosenClass.name == "Monk"
                              ? "Monks CANNOT be Chaotic"
                              : state.chosenClass.name == "Cleric"
                                  ? "Clerics CANNOT be Neutral"
                                  : state.chosenClass.name == "Druid"
                                      ? "Druids CANNOT be Neutral"
                                      : state.chosenClass.name == "Bandit"
                                          ? "Bandits CANNOT be Lawful or Good"
                                          : "${state.chosenClass.name}s can be of ANY alignment"),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              width: size.width * 0.92,
              height: size.height * 0.003,
              color: Colors.grey,
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: size.width * 0.4,
                      childAspectRatio: 5 / 2.5,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1),
                  itemCount: state.filteredAlignments.length,
                  itemBuilder: (context, index) {
                    var alignment = state.filteredAlignments[index];
                    return InkWell(
                        child: Card(
                          color: alignment.isSelected
                              ? Colors.red[900]
                              : Colors.grey[700],
                          elevation: 12,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Text(
                                alignment.name,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          state.switchAlignment(alignment);
                        });
                  }),
            ),
            AdvanceButton(size: size, onTap: onTap)
          ],
        );
      }),
    );
  }
}
