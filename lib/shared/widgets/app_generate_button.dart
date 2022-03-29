import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppGenerateButton extends StatelessWidget {
  final VoidCallback onGenerate;
  final Widget? icon;

  const AppGenerateButton({
    Key? key,
    required this.onGenerate,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPressed: onGenerate,
      color: Colors.grey[900]!,
      duration: 60,
      width: deviceWidth! < 400 ? 52 : 62,
      height: deviceWidth! < 400 ? 52 : 62,
      child: icon ??
          SvgPicture.asset(
            "assets/images/dice-random.svg",
            color: Colors.grey.shade400,
          ),
    );
  }
}
