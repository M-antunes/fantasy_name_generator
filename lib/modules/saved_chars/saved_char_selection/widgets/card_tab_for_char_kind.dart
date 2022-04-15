import 'package:flutter/material.dart';

import '../../../../shared/themes/app_text_styles.dart';

class CardTabForCharKind extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double? elevation;
  final Color? color;
  final Color? textColor;
  const CardTabForCharKind({
    Key? key,
    required this.label,
    required this.onTap,
    this.elevation,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        )),
        margin: EdgeInsets.zero,
        elevation: elevation ?? 0,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: color ?? Colors.transparent,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
            child: Text(
              label,
              style: AppTextStyle.generatedName
                  .copyWith(color: textColor ?? Colors.grey[600]),
            ),
          ),
        ),
      ),
    );
  }
}
