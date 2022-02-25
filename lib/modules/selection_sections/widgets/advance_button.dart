import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class AdvanceButton extends StatelessWidget {
  final Size size;
  final VoidCallback onTap;
  const AdvanceButton({
    Key? key,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: size.height * 0.05),
        InkWell(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 3,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'NEXT',
                    style: AppTextStyle.generatedName,
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
