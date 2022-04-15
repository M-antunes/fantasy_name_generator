import 'package:fantasy_name_generator/modules/saved_chars/saved_char_selection/bosses/boss_separation_group.dart';
import 'package:fantasy_name_generator/shared/routes/app_roues.dart';
import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/widgets/expanded_section.dart';

import 'minions/minion_separation_group.dart';
import 'widgets/card_tab_for_char_kind.dart';

class SavedCharSelection extends StatefulWidget {
  const SavedCharSelection({Key? key}) : super(key: key);

  @override
  State<SavedCharSelection> createState() => _SavedCharSelectionState();
}

class _SavedCharSelectionState extends State<SavedCharSelection> {
  bool minionPressed = true;

  switPressingTabs() {
    setState(() {
      minionPressed = !minionPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardTabForCharKind(
                    label: 'MINIONS',
                    textColor: minionPressed == true ? Colors.white : null,
                    color: minionPressed == true ? Colors.grey[900] : null,
                    elevation: minionPressed == true ? 12 : null,
                    onTap: () =>
                        minionPressed == true ? null : switPressingTabs()),
                CardTabForCharKind(
                    label: 'BOSSES',
                    textColor: minionPressed != true ? Colors.white : null,
                    color: minionPressed != true ? Colors.grey[900] : null,
                    elevation: minionPressed != true ? 12 : null,
                    onTap: () =>
                        minionPressed != true ? null : switPressingTabs()),
              ],
            ),
            Card(
              color: Colors.grey[900],
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.zero,
              )),
              margin: EdgeInsets.zero,
              elevation: 12,
              child: SizedBox(
                  width: double.infinity,
                  height: deviceHeight! - 95,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (contex, index) {
                            return minionPressed
                                ? MinionSeparationGroup(
                                    className: "Barbarian",
                                    numberOfChars: 4,
                                    isSelected: true,
                                  )
                                : BossSeparationGroup(
                                    className: "Warrior",
                                    numberOfChars: 2,
                                    isSelected: true,
                                  );
                          }),
                    ],
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
