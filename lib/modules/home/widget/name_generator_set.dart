import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/controller.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class NameGeneratorSet extends StatelessWidget {
  final Size size;
  final RaceModel initialRace;
  const NameGeneratorSet({
    Key? key,
    required this.size,
    required this.initialRace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.15,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: size.width * 0.66,
                height: size.height * 0.35,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Consumer<Controller>(
                          builder: (context, state, child) {
                        return state.readyToSwitchRace
                            ? Image.asset(state.chosenRace.picture)
                            : Image.asset(initialRace.picture);
                      })),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child:
                        Consumer<Controller>(builder: (context, state, child) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        child: SizedBox(
                          height: size.height * 0.04,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              'big name ',
                              style: AppTextStyle.generatedName,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  )
                ],
              ),
            ],
          ),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.02,
            ),
            child: Container(
              height: size.height * 0.06,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: SizedBox(
                  width: size.width * 0.2,
                  child: const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text('Generate'),
                  ),
                ),
              ),
            ),
          ),
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          radius: 0,
          highlightColor: Colors.transparent,
          onTap: () {},
        ),
        SizedBox(height: size.height * 0.02),
      ],
    );
  }
}
