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
                      maxCrossAxisExtent: size.width * 0.3,
                      childAspectRatio: 8 / 5,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 8),
                  itemCount: state.listOfClasses.allClasses.length,
                  itemBuilder: (context, index) {
                    var charClass = state.listOfClasses.allClasses[index];
                    return InkWell(
                        child: SvgPicture.asset(
                          charClass.classIcon!,
                          color: charClass.isSelected ? Colors.red[900] : null,
                        ),
                        onTap: () {
                          state.switchClass(charClass);
                        });
                  }),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: const EdgeInsets.all(10),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "${state.tempoClassForSwitching.name}:  ",
                          style: AppTextStyle.traitValue),
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
