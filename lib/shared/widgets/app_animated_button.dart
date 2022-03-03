import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

class AppAnimatedButton extends StatelessWidget {
  final VoidCallback onGenerate;
  final String? label; 
  const AppAnimatedButton({
    Key? key,
    required this.onGenerate,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedButton(
      color: Colors.grey[700]!,
      duration: 30,
      height: 50,
      onPressed: onGenerate,
      child: Center(
        child: SizedBox(
          width: size.width * 0.2,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(label ?? 'Generate'),
          ),
        ),
      ),
    );
  }
}
