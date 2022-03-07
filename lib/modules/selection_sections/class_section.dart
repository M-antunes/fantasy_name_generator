import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
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
      child: Consumer<CharController>(
        builder: (context, state, child) {
          return Column(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: size.width * 0.2,
                      childAspectRatio: 9 / 8,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 8),
                  itemCount: state.listOfClasses.allClasses.length,
                  itemBuilder: (context, index) {
                    var charClass = state.listOfClasses.allClasses[index];
                    return Column(
                      children: [
                        InkWell(
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  charClass.classIcon!,
                                  width: charClass.isSelected ? 55 : 50,
                                  height: charClass.isSelected ? 55 : 50,
                                  color: charClass.isSelected
                                      ? AppColors.primary
                                      : null,
                                ),
                                Text(
                                  charClass.name,
                                  style: TextStyle(
                                      color: charClass.isSelected
                                          ? AppColors.primary
                                          : null,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            onTap: () {
                              state.switchClass(charClass);
                            }),
                      ],
                    );
                  }),
              SizedBox(height: size.height * 0.02),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(state.tempoClassForSwitching.name,
                      style: AppTextStyle.traitValue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Container(
                  width: size.width * 0.93,
                  height: size.height * 0.003,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: state.tempoClassForSwitching.description,
                        style: AppTextStyle.traitDescription,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
