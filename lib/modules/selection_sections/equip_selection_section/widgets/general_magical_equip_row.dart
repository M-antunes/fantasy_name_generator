import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/equip_controller.dart';
import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/expanded_section.dart';

// ignore: must_be_immutable
class GeneralMagicalEquipRow extends StatelessWidget {
  final String label;
  final String item;
  final String description;
  final VoidCallback onTap;
  bool selected;
  GeneralMagicalEquipRow({
    Key? key,
    required this.label,
    required this.item,
    required this.description,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EquipController>(builder: (context, state, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: "$label:  ", style: AppTextStyle.statsLabel),
                TextSpan(text: item, style: AppTextStyle.statsValue),
              ])),
              const SizedBox(width: 6),
              InkWell(
                  child: selected
                      ? const Icon(Icons.arrow_drop_down,
                          size: 30, color: Colors.blueGrey)
                      : const Icon(Icons.arrow_right,
                          size: 30, color: Colors.blueGrey),
                  onTap: onTap),
            ],
          ),
          ExpandedSection(
            expand: selected,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: description,
                          style: AppTextStyle.longDescription),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: deviceHeight! * 0.004),
        ],
      );
    });
  }
}
