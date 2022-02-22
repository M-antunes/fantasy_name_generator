import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class SnackbarMessage extends StatelessWidget {
  final String text;
  final IconData icon;
  const SnackbarMessage({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.033,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          Icon(icon, size: 28),
          const SizedBox(width: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(text, style: AppTextStyle.generatedName),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
