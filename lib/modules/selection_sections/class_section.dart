import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/modules/selection_sections/widgets/advance_button.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class ClassSelection extends StatelessWidget {
  const ClassSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      // height: size.height * 0.7,
      width: double.maxFinite,
      child: Consumer<CharController>(builder: (context, state, child) {
        return Column(
          children: [
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: size.width * 0.4,
                    childAspectRatio: 5 / 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1),
                itemCount: state.listOfClasses.allClasses.length,
                itemBuilder: (context, index) {
                  var charClass = state.listOfClasses.allClasses[index];
                  return InkWell(
                      child: Card(
                        color: charClass.isSelected
                            ? Colors.red[900]
                            : Colors.grey[700],
                        elevation: 12,
                        child: Center(
                          child: Text(
                            charClass.name,
                          ),
                        ),
                      ),
                      onTap: () {
                        state.switchClass(charClass);
                      });
                }),
            // SizedBox(height: size.height * 0.03),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     AppAnimatedButton(
            //       label: "Previous",
            //       onGenerate: () => state.retreatCreationStage(),
            //     ),
            //     AppAnimatedButton(
            //       onGenerate: onTap,
            //     ),
            //   ],
            // )
          ],
        );
      }),
    );
  }
}
