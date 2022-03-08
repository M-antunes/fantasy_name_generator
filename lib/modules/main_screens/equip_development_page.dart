import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/modules/selection_sections/equip_selection_section/fight_style_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/modules/main_screens/widgets/progression_bar.dart';
import 'package:fantasy_name_generator/modules/main_screens/widgets/selection_label.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';
import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';

import '../../shared/data/test.dart';
import '../selection_sections/equip_selection_section/style_segment_section.dart';

class EquipDevelopMentPage extends StatefulWidget {
  const EquipDevelopMentPage({Key? key}) : super(key: key);

  @override
  _EquipDevelopMentPageState createState() => _EquipDevelopMentPageState();
}

class _EquipDevelopMentPageState extends State<EquipDevelopMentPage> {
  late final EquipController equipController;

  @override
  void initState() {
    equipController = context.read<EquipController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CharModel char = ModalRoute.of(context)!.settings.arguments as CharModel;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<EquipController>(builder: (context, state, child) {
        state.char = char;
        return ListView(
          children: [
            SelectionLabel(
                size: size,
                label: state.creationStage == 1
                    ? "Equipment - Style"
                    : state.creationStage == 2
                        ? "Equipment - Weapon segment"
                        : state.creationStage == 3
                            ? "Equipment - Class"
                            : state.creationStage == 4
                                ? "Equipment - Alignment"
                                : state.creationStage == 5
                                    ? "Equipment - Level"
                                    : state.creationStage == 6
                                        ? "Equipment - Stats"
                                        : state.creationStage == 7
                                            ? "Equipment - Basic features ready"
                                            : ''),
            EquipProgressionBar(
              controller: state,
            ),
            if (state.creationStage == 1) FightStyleSection(char: char),
            if (state.creationStage == 2) StyleSegmentSection(),
          ],
        );
      }),
      bottomNavigationBar:
          Consumer<EquipController>(builder: (context, state, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppAnimatedButton(
                  label: "Previous",
                  onTap: () {
                    if (state.creationStage == 1) {
                      Navigator.of(context).pop();
                    } else {
                      state.retreatCreationStage();
                    }
                  }),
              AppAnimatedButton(onTap: () => buttonFunction(state, context)),
            ],
          ),
        );
      }),
    );
  }

  void buttonFunction(EquipController state, BuildContext context) {
    var text = state.activateNextButton();
    if (text != null) {
      callMessageSnackbar(context, text, AppColors.warningColor);
    }
  }
}
