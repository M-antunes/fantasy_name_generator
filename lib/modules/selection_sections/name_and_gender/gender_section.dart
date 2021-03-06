import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';

class GenderSelection extends StatelessWidget {
  const GenderSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
        child: Consumer<CharController>(builder: (context, state, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: size.height * 0.15,
                      width:
                          state.isMale ? size.width * 0.7 : size.width * 0.26,
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Icon(Icons.male_rounded, color: Colors.grey),
                        ),
                      ),
                    ),
                    onTap: () => state.switchToMale(),
                  ),
                  Container(
                      width: size.width * 0.01,
                      height: size.height * 0.15,
                      color: Colors.grey),
                  InkWell(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: size.height * 0.15,
                      width:
                          state.isFemale ? size.width * 0.7 : size.width * 0.26,
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Icon(Icons.female_rounded, color: Colors.grey),
                        ),
                      ),
                    ),
                    onTap: () => state.switchToFemale(),
                  ),
                ],
              ),
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
              //     )
              //   ],
              // ),
            ],
          );
        }),
      ),
    );
  }
}
