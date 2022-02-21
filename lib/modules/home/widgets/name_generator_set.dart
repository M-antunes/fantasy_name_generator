import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/names_controller.dart';
import 'package:fantasy_name_generator/models/race_model.dart';

import 'picture_board.dart';

class NameGeneratorSet extends StatefulWidget {
  final Size size;
  final RaceModel initialRace;
  final NamesController controller;
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
        PictureBoard(
          initialRace: widget.initialRace,
          size: widget.size,
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
            widget.controller.newNameGenerator();
          },
        ),
        SizedBox(height: widget.size.height * 0.02),
      ],
    );
  }
}
