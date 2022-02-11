import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/app_controller.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class NameGeneratorSet extends StatefulWidget {
  final Size size;
  final RaceModel initialRace;
  final AppController controller;
  const NameGeneratorSet({
    Key? key,
    required this.size,
    required this.initialRace,
    required this.controller,
  }) : super(key: key);

  @override
  State<NameGeneratorSet> createState() => _NameGeneratorSetState();
}

class _NameGeneratorSetState extends State<NameGeneratorSet> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.size.width * 0.15,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: widget.size.width * 0.66,
                height: widget.size.height * 0.35,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Consumer<AppController>(
                          builder: (context, state, child) {
                        return state.readyToSwitchRace
                            ? Image.asset(state.chosenRace.picture)
                            : Image.asset(widget.initialRace.picture);
                      })),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Consumer<AppController>(
                        builder: (context, state, child) {
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
                          height: widget.size.height * 0.04,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              state.newName,
                              style: AppTextStyle.generatedName,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    height: widget.size.height * 0.01,
                  )
                ],
              ),
            ],
          ),
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: widget.size.height * 0.02,
            ),
            child: Container(
              height: widget.size.height * 0.06,
              width: widget.size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: SizedBox(
                  width: widget.size.width * 0.2,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: const Text('Generate'),
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
          onTap: () {
            // setState(() => isLoading = true);
            widget.controller.newNameGenerator();
            // setState(() => isLoading = false);
          },
        ),
        SizedBox(height: widget.size.height * 0.02),
      ],
    );
  }
}
