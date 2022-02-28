import 'package:animated_button/animated_button.dart';
import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/modules/selection_sections/widgets/advance_button.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';

class NameSelection extends StatelessWidget {
  final VoidCallback onGenerate;
  final VoidCallback onSelect;
  const NameSelection({
    Key? key,
    required this.onGenerate,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Consumer<CharController>(builder: (context, state, child) {
            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onDoubleTap: () => state.switchNameAndLastName(),
              child: Container(
                height: size.height * 0.1,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 3,
                ),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: size.height * 0.035,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        state.lastNameShown
                            ? "${state.newName} ${state.newLastName}"
                            : state.newName,
                        style: AppTextStyle.generatedName,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () => callMessageSnackbar(
                context,
                "Double tap to switch name and last name",
                Colors.grey[700],
              ),
            );
          }),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        AppAnimatedButton(onGenerate: onGenerate),
        AdvanceButton(size: size, onTap: onSelect)
      ],
    );
  }
}
