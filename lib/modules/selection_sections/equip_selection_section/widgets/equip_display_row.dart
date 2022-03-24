import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';

import '../../../../models/equip_models/armor_type_model.dart';
import '../../../../models/equip_models/weapon_type_model.dart';
import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/app_horizontal_line.dart';
import 'armor_permission_label.dart';

class EquipDisplayRow extends StatelessWidget {
  final String label;
  final int itemCounting;
  final VoidCallback onLongPress;
  final List<WeaponFamilyModel>? weaponList;
  final List<ArmorFamilyModel>? armorList;
  const EquipDisplayRow({
    Key? key,
    required this.label,
    required this.itemCounting,
    required this.onLongPress,
    this.weaponList,
    this.armorList,
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
        if (armorList != null) const ArmorPermissionLabel(),
        Container(
          height: deviceHeight! * 0.1,
          width: deviceWidth! - 20,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Consumer<EquipController>(builder: (context, state, child) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: itemCounting,
                  childAspectRatio: itemCounting < 4 ? 10 / 5 : 1 / 1.2,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemCounting,
                itemBuilder: (context, index) {
                  var armor = armorList?[index];
                  var weapon = weaponList?[index];
                  return weapon != null
                      ? InkWell(
                          focusColor: Colors.transparent,
                          highlightColor: AppColors.primaryText0,
                          borderRadius: BorderRadius.circular(50),
                          radius: 10,
                          splashColor: Colors.transparent,
                          onLongPress: onLongPress,
                          onTap: () => state.switchPrimaryWeaponType(weapon),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(weapon.name,
                                    style: weapon.isSelected
                                        ? AppTextStyle.weaponSelected
                                        : AppTextStyle.weaponNotSelected),
                              ),
                              SvgPicture.asset(
                                weapon.picture,
                                height: deviceWidth! < 400 ? 30 : 40,
                                color: weapon.isSelected
                                    ? AppColors.primary
                                    : null,
                              ),
                            ],
                          ),
                        )
                      : armor != null
                          ? InkWell(
                              focusColor: Colors.transparent,
                              highlightColor: AppColors.primaryText0,
                              borderRadius: BorderRadius.circular(50),
                              radius: 10,
                              splashColor: Colors.transparent,
                              onLongPress: onLongPress,
                              onTap: () => state.switchArmorType(armor),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(armor.name,
                                        style: armor.isSelected
                                            ? AppTextStyle.weaponSelected
                                            : AppTextStyle.weaponNotSelected),
                                  ),
                                  SvgPicture.asset(
                                    armor.picture,
                                    height: deviceWidth! < 400 ? 30 : 40,
                                    color: armor.isSelected
                                        ? AppColors.primary
                                        : null,
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox();
                });
          }),
        ),
      ],
    );
  }
}
