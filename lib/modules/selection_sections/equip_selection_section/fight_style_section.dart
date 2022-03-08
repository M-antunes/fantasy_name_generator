import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import '../../../shared/themes/app_text_styles.dart';

class FightStyleSection extends StatelessWidget {
  final CharModel char;
  const FightStyleSection({
    Key? key,
    required this.char,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<EquipController>(builder: (context, state, child) {
        return Column(
          children: [
            SizedBox(height: size.height * 0.03),
            Text("Select ${char.charName.fullName}'s primary fight style",
                style: AppTextStyle.mainPageLabel, textAlign: TextAlign.center),
            // AtributeDivision(label: "Weapons", size: size),
            SizedBox(height: size.height * 0.15),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: size.width * 0.5,
                    childAspectRatio: 8 / 8,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 1),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  var combatStyle = state.listOfClasses.fightingStyle[index];
                  return InkWell(
                    splashColor: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      // width: size.height * 0.2,
                      // height: size.height * 0.2,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            combatStyle.value.value,
                            width: 90,
                            height: 90,
                            color: combatStyle.value.key
                                ? AppColors.primary
                                : null,
                          ),
                          Text(combatStyle.key,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: combatStyle.value.key
                                      ? AppColors.primary
                                      : null)),
                        ],
                      ),
                    ),
                    onTap: () => state.switchCombatStyle(combatStyle),
                  );
                }),
          ],
        );
      }),
    );
  }
}
