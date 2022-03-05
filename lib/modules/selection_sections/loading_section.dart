import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoadingSection extends StatelessWidget {
  const LoadingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<CharController>(builder: (context, state, child) {
        return SizedBox(
            width: 80,
            height: 80,
            child: SvgPicture.asset("assets/images/dice-six-faces-one.svg"));
      }),
    );
  }
}
