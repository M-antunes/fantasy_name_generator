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
        duration: 80,
        width: 72,
        height: 72,
        child: icon ?? SvgPicture.asset("assets/images/dice-random.svg"));
  }
}