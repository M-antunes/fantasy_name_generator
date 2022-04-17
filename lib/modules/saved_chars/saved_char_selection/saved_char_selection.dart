import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';

import '../../../controllers/char_admin_controller/char_adimin_controller.dart';
import '../../../shared/routes/app_roues.dart';
import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_text_styles.dart';
import '../../../shared/widgets/expanded_section.dart';
import 'minions/saved_minion_tile.dart';
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
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.storedClasses.length,
                                itemBuilder: (contex, index) {
                                  var storedClass = state.storedClasses[index];
                                  return MinionGroups(
                                    isSelected: storedClass.isSelected,
                                    storedClass: "${storedClass.name}s",
                                    characterQnt:
                                        state.claculateNumberOfCharsPerClass(
                                            storedClass.name),
                                    classList: state.returningRightClassList(
                                        storedClass.name),
                                    onTap: () => state.showDescriptions(
                                        index, state.storedClasses),
                                  );
                                });
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

class MinionGroups extends StatelessWidget {
  final bool isSelected;
  final String storedClass;
  final int characterQnt;
  final List<CharModel> classList;
  final VoidCallback onTap;
  const MinionGroups({
    Key? key,
    this.isSelected = false,
    required this.storedClass,
    required this.characterQnt,
    required this.classList,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Chip(
                elevation: 10,
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(storedClass,
                        style: AppTextStyle.legendaryLabel.copyWith(
                            color: AppColors.primaryText, fontSize: 26)),
                    CircleAvatar(
                      radius: 14,
                      child: Text(
                        "$characterQnt",
                        style: AppTextStyle.subTextWhitePlusSize,
                      ),
                    ),
                  ],
                )),
            ExpandedSection(
                expand: isSelected,
                child: ListView.builder(
                    itemCount: characterQnt,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var char = classList[index];
                      return SavedMinionTile(
                        level: char.charLevel,
                        charName: char.charName.fullName,
                        isMale: char.charName.gender == "Male" ? true : false,
                        onTap: () => Navigator.of(context).pushNamed(
                            AppRoutes.savedCharSheet,
                            arguments: char),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
