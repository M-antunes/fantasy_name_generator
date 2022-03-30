import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';

import '../../../../models/equip_models/off_hand_type_model.dart';
import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/app_horizontal_line.dart';
import 'shield_permission_label.dart';

class OffHandDisplayRow extends StatelessWidget {
  final String label;
  final int itemCounting;
  final VoidCallback onLongPress;
  final List<OffHandTypeModel>? offHandList;
  const OffHandDisplayRow({
    Key? key,
    required this.label,
    required this.itemCounting,
    required this.onLongPress,
    this.offHandList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const AppHorizontalLine(),
              Chip(
                  label: Text(
                label,
                style: AppTextStyle.weaponCategoryText,
              ))
            ],
          ),
        ),
        const ShieldPermissionLabel(),
        Container(
          width: deviceWidth! - 20,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Consumer<EquipController>(builder: (context, state, child) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: itemCounting > 6
                      ? 5
                      : itemCounting == 5
                          ? 5
                          : itemCounting == 4
                              ? 4
                              : itemCounting == 3
                                  ? 3
                                  : itemCounting == 2
                                      ? 2
                                      : 1,
                  childAspectRatio: 1 / 1,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemCounting,
                itemBuilder: (context, index) {
                  var offHand = offHandList?[index];
                  return InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: AppColors.primaryText0,
                    borderRadius: BorderRadius.circular(50),
                    radius: 5,
                    splashColor: Colors.transparent,
                    onLongPress: onLongPress,
                    onTap: () => state.switchOffHandWeaponType(offHand!),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text(offHand!.name,
                              style: offHand.isSelected
                                  ? AppTextStyle.weaponSelected
                                  : AppTextStyle.weaponNotSelected),
                        ),
                        SvgPicture.asset(
                          offHand.picture,
                          height: deviceWidth! < 400 ? 30 : 40,
                          color: offHand.isSelected ? AppColors.primary : null,
                        ),
                      ],
                    ),
                  );
                });
          }),
        ),
      ],
    );
  }
}
