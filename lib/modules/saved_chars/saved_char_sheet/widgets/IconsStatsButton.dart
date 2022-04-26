// ignore_for_file: file_names

import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/themes/app_colors.dart';

class IconStatsButton extends StatelessWidget {
  final String svg;
  final VoidCallback onTap;
  final bool isSelected;
  const IconStatsButton({
    Key? key,
    required this.svg,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: CircleAvatar(
            backgroundColor: Colors.black54,
            radius: deviceWidth! < 350 ? 28 : 32,
            child: SvgPicture.asset(
              "assets/images/$svg.svg",
              color: isSelected ? AppColors.primary : null,
              height: deviceWidth! < 350 ? 38 : 48,
            )),
      ),
    );
  }
}
