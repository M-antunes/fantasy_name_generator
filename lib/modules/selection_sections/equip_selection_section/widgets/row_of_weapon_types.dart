import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../controllers/equip_controller.dart';
import '../../../../models/equip_models/weapon_type_model.dart';
import '../../../../shared/themes/app_colors.dart';

class RowOfWeaponType extends StatelessWidget {
  final Size size;
  final EquipController ctrl;
  final List<WeaponTypeModel> weaponTypeList;
  final bool isTypeDescriptionSelected;
  const RowOfWeaponType({
    Key? key,
    required this.size,
    required this.ctrl,
    required this.weaponTypeList,
    required this.isTypeDescriptionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: weaponTypeList.length < 4 ? 11 / 8 : 1 / 1.5,
          crossAxisCount: weaponTypeList.length < 4 ? 3 : 6,
        ),
        shrinkWrap: true,
        itemCount: weaponTypeList.length,
        itemBuilder: (context, index) {
          var weaponType = weaponTypeList[index];
          return InkWell(
            splashColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weaponType.name,
                  style: TextStyle(
                    color: weaponType.isSelected
                        ? AppColors.primary
                        : Colors.grey[400],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                  child: SvgPicture.asset(
                    weaponType.picture,
                    color: weaponType.isSelected
                        ? AppColors.primary
                        : Colors.grey[400],
                  ),
                ),
              ],
            ),
            onTap: () => ctrl.chosenPrimaryWeaponType != null
                ? ctrl.switchSecondaryWeaponType(weaponType)
                : ctrl.switchPrimaryWeaponType(weaponType),
          );
        },
      ),
    );
  }
}
