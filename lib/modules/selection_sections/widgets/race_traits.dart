import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RaceTraits extends StatelessWidget {
  const RaceTraits({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<CharController>(builder: (context, state, child) {
      return Column(
        children: [
          Text("${state.tempRaceForSwitching.name} Traits"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Container(
              width: size.width * 0.5,
              height: size.height * 0.003,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: size.width * 0.5,
            child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var trait = state.tempRaceForSwitching.traits;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "${trait![index].key}  ",
                              style: AppTextStyle.traitValue),
                          TextSpan(
                              text: trait[index].value,
                              style: AppTextStyle.traitDescription),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      );
    });
  }
}
