// ignore: must_be_immutable
import 'package:flutter/material.dart';

import '../../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../../shared/widgets/expanded_section.dart';

// ignore: must_be_immutable
class FeatListWidget extends StatelessWidget {
  final String name;
  final String? focusOrSpecialization;
  bool selected;
  final VoidCallback onTap;
  final String description;
  FeatListWidget({
    Key? key,
    required this.name,
    this.focusOrSpecialization,
    required this.selected,
    required this.onTap,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            child: Row(
              children: [
                Text(name,
                    style: AppTextStyle.statsLabel
                        .copyWith(color: Colors.grey[400])),
                Text(" $focusOrSpecialization",
                    style: AppTextStyle.longDescription
                        .copyWith(color: Colors.grey[400])),
                selected
                    ? const Icon(Icons.arrow_drop_down,
                        size: 25, color: Colors.blueGrey)
                    : const Icon(Icons.arrow_right,
                        size: 25, color: Colors.blueGrey),
              ],
            ),
            onTap: onTap),
        ExpandedSection(
          expand: selected,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: description, style: AppTextStyle.longDescription),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
