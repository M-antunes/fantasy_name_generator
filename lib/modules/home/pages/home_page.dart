import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:fantasy_name_generator/modules/home/widget/bottom_sheet_race.dart';
import 'package:fantasy_name_generator/modules/home/widget/card_to_flip.dart';
import 'package:fantasy_name_generator/modules/home/widget/name_generator_set.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

import 'package:fantasy_name_generator/controllers/controller.dart';
import 'package:fantasy_name_generator/modules/drawer/app_drawer.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool isMaleSet = true;
  bool isFemaleSet = false;
  late final Controller appController;
  late final RaceModel initialRace;

  @override
  void initState() {
    appController = context.read<Controller>();
    initialRace = appController.races[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: AppDrawer(size: size),
      appBar: AppBar(
        title: SizedBox(
          width: size.width * 0.6,
          child: const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('Fantasy Name Generator'),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: size.height * 0.04,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Consumer<Controller>(builder: (context, state, child) {
                  return appController.readyToSwitchRace
                      ? Text("${state.chosenRace.name} Names")
                      : Text("${initialRace.name} Names");
                }),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          NameGeneratorSet(size: size, initialRace: initialRace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlipCard(
                key: cardKey,
                fill: Fill.fillBack,
                direction: FlipDirection.HORIZONTAL,
                front: CardToFlip(
                  size: size,
                  cardKey: cardKey,
                  text: 'Male',
                  isSet: isMaleSet,
                ),
                back: CardToFlip(
                  size: size,
                  cardKey: cardKey,
                  text: 'Female',
                  isSet: isFemaleSet,
                ),
              ),
              InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: const Text(
                    'Change Race',
                    style: AppTextStyle.changeRace,
                  ),
                  onTap: () {
                    appController.readyToSwitchRace = true;
                    showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return StatefulBuilder(builder: (context, setState) {
                          return BottomSheetRace(
                            size: size,
                            race: appController.races,
                            controller: appController,
                          );
                        });
                      },
                    );
                  }),
              TextButton(
                child: const Text(
                  'Save\nName',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.generatedName,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
