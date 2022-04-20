import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/char_admin_controller/char_adimin_controller.dart';
import '../../../shared/constants/phone_sizes.dart';
import 'boss/boss_separation_group.dart';
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
                      Consumer<CharAdminController>(
                          builder: (context, state, child) {
                        return state.allChars.isEmpty
                            ? const Text("You have no Character generated.")
                            : !minionPressed
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: state.storedClasses.length,
                                    itemBuilder: (contex, index) {
                                      var storedClass =
                                          state.storedClasses[index];
                                      return BossGroups(
                                        isSelected: storedClass.isSelected,
                                        storedClass: "${storedClass.name}s",
                                        characterQnt: state
                                            .claculateNumberOfCharsPerClass(
                                                storedClass.name),
                                        classList:
                                            state.returningRightClassList(
                                                storedClass.name),
                                        onTap: () => state.showDescriptions(
                                            index, state.storedClasses),
                                      );
                                    })
                                : const SizedBox();
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
