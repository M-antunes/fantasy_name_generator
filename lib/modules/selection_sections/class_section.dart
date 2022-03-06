import 'package:float_column/float_column.dart';
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
                      maxCrossAxisExtent: size.width * 0.4,
                      childAspectRatio: 5 / 1.6,
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
              // Text("${state.tempoClassForSwitching.name} Traits",
              //     style: AppTextStyle.flipCardMale),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 3),
              //   child: Container(
              //     width: size.width * 0.95,
              //     height: size.height * 0.003,
              //     color: Colors.grey,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: FloatColumn(
                  children: [
                    Floatable(
                      padding: EdgeInsets.only(right: 10),
                      float: FCFloat.start,
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: SvgPicture.asset(
                          "assets/images/classes/${state.tempoClassForSwitching.name.toLowerCase()}.svg",
                        ),
                      ),
                    ),
                    WrappableText(
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
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
