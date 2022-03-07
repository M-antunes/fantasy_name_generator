import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';

import '../../shared/themes/app_text_styles.dart';

class ProgressCheck extends StatefulWidget {
  final VoidCallback onAdvance;
  const ProgressCheck({
    Key? key,
    required this.onAdvance,
  }) : super(key: key);

  @override
  State<ProgressCheck> createState() => _ProgressCheckState();
}

class _ProgressCheckState extends State<ProgressCheck> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<CharController>(builder: (context, state, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: AppTextStyle.selectButtonNotReady,
                      children: [
                        const TextSpan(
                          text: "The  ",
                        ),
                        TextSpan(
                            text: state.generatedChar.charClass.name,
                            style: AppTextStyle.selectButtonReady),
                        const TextSpan(
                          text: "  of level  ",
                        ),
                        TextSpan(
                            text: "${state.generatedChar.charLevel}, ",
                            style: AppTextStyle.selectButtonReady),
                        const TextSpan(
                          text: " named  ",
                        ),
                        TextSpan(
                            text: state.generatedChar.charName.fullName,
                            style: AppTextStyle.selectButtonReady),
                        const TextSpan(
                          text: "  has no equipment so far.",
                        ),
                      ])),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
                "Select ${state.generatedChar.charName.fullName}'s primary fight style",
                style: AppTextStyle.mainPageLabel,
                textAlign: TextAlign.center),
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      // width: size.height * 0.2,
                      // height: size.height * 0.2,
                      margin: EdgeInsets.symmetric(horizontal: 12),
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
                    onTap: () {
                      setState(() {
                        state.listOfClasses.fightingStyle[0].value.key = false;
                        state.listOfClasses.fightingStyle[1].value.key = false;
                        combatStyle.value.key = !combatStyle.value.key;
                      });
                    },
                  );
                }),
          ],
        );
      }),
    );
  }
}
