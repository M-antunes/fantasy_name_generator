import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';

import 'widgets/advance_button.dart';

class GenderSelection extends StatelessWidget {
  final VoidCallback onTap;
  const GenderSelection({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.maxFinite,
      child: Consumer<CharController>(builder: (context, state, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: size.height * 0.3,
                    width: state.isMale ? size.width * 0.7 : size.width * 0.28,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text("Male",
                            style: TextStyle(
                                fontSize: state.isMale ? 60 : 20,
                                color: state.isMale
                                    ? Colors.yellow
                                    : Colors.white)),
                      ),
                    ),
                  ),
                  onTap: () => state.switchToMale(),
                ),
                Container(
                  width: size.width * 0.01,
                  height: size.height * 0.3,
                  color: Colors.white,
                ),
                InkWell(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: size.height * 0.3,
                    width:
                        state.isFemale ? size.width * 0.7 : size.width * 0.28,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Female",
                            style: TextStyle(
                                fontSize: state.isFemale ? 60 : 20,
                                color: state.isFemale
                                    ? Colors.yellow
                                    : Colors.white)),
                      ),
                    ),
                  ),
                  onTap: () => state.switchToFemale(),
                ),
              ],
            ),
            AdvanceButton(
              size: size,
              onTap: onTap,
            ),
          ],
        );
      }),
    );
  }
}
