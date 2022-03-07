import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:fantasy_name_generator/modules/selection_sections/equip_selection_section/fight_style_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/modules/main_screens/widgets/progression_bar.dart';
import 'package:fantasy_name_generator/modules/main_screens/widgets/selection_label.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';
import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';

class EquipDevelopMentPage extends StatefulWidget {
  const EquipDevelopMentPage({Key? key}) : super(key: key);

  @override
  _EquipDevelopMentPageState createState() => _EquipDevelopMentPageState();
}

class _EquipDevelopMentPageState extends State<EquipDevelopMentPage>
    with TickerProviderStateMixin {
  late final EquipController equipController;
  late final CharController charController;

  @override
  void initState() {
    equipController = context.read<EquipController>();
    equipController.char = charController.generatedChar;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<EquipController>(builder: (context, state, child) {
        return ListView(
          children: [
            SelectionLabel(
                size: size,
                label: state.creationStage == 1
                    ? "Style"
                    : state.creationStage == 2
                        ? "Gender & Name"
                        : state.creationStage == 3
                            ? "Class"
                            : state.creationStage == 4
                                ? "Alignment"
                                : state.creationStage == 5
                                    ? "Level"
                                    : state.creationStage == 6
                                        ? "Stats"
                                        : state.creationStage == 7
                                            ? "Basic features ready"
                                            : ''),
            EquipProgressionBar(
              controller: state,
            ),
            if (state.creationStage == 1) FightStyleSection()
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
