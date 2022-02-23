import 'package:fantasy_name_generator/controllers/names_controller.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PictureBoard extends StatelessWidget {
  final Size size;
  final RaceModel initialRace;

  const PictureBoard({
    Key? key,
    required this.size,
    required this.initialRace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                child: Consumer<NamesController>(
                  builder: (context, state, child) {
                    return state.readyToSwitchRace
                        ? Image.asset(
                            state.isMale
                                ? state.chosenRace.malePicture
                                : state.chosenRace.femalePicture,
                          )
                        : Image.asset(
                            state.isMale
                                ? initialRace.malePicture
                                : initialRace.femalePicture,
                          );
                  },
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child:
                    Consumer<NamesController>(builder: (context, state, child) {
                  return InkWell(
                    onDoubleTap: () => state.switchNameAndLastName(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      child: SizedBox(
                        height: size.height * 0.035,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            state.lastNameShown
                                ? "${state.newName} ${state.newLastName}"
                                : state.newName,
                            style: AppTextStyle.generatedName,
                          ),
                        ),
                      ),
                    ),
                    onTap: () => callMessageSnackbar(
                      context,
                      "Double tap to switch name and last name",
                      Colors.grey[700],
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
    );
  }
}
