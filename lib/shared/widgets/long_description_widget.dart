import 'package:flutter/material.dart';

import '../constants/phone_sizes.dart';
import '../themes/app_text_styles.dart';

class LongDescriptionWidget extends StatelessWidget {
  final String label;
  final String description;
  const LongDescriptionWidget({
    Key? key,
    required this.label,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyle.subTextWhite),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Container(
              width: deviceWidth! * 0.93,
              height: deviceHeight! * 0.003,
              color: Colors.grey,
            ),
          ),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              children: [
                TextSpan(
                  text: description,
                  style: AppTextStyle.longDescription,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
