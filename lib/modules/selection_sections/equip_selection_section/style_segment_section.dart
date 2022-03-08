import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:fantasy_name_generator/models/equip_models/weapon_type_model.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/widgets/expanded_section.dart';

class StyleSegmentSection extends StatelessWidget {
  const StyleSegmentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<EquipController>(
      builder: (context, state, child) {
        return Column(
          children: [
            WeapomSectionLabel(size: size, ctrl: state, label: "One-handed"),
            ExpandedSection(
              expand: state.showOneHanded,
              child: RowOfWeaponType(
                size: size,
                ctrl: state,
                weaponTypeList: state.listOfEquip.oneHandedTypes,
                isTypeDescriptionSelected: state.showOneHanded,
              ),
            ),
            WeapomSectionLabel(size: size, ctrl: state, label: "Two-handed"),
            ExpandedSection(
              expand: state.showTwoHanded,
              child: RowOfWeaponType(
                size: size,
                ctrl: state,
                weaponTypeList: state.listOfEquip.twoHandedTypes,
                isTypeDescriptionSelected: state.showTwoHanded,
              ),
            ),
            WeapomSectionLabel(size: size, ctrl: state, label: "Distant"),
            ExpandedSection(
              expand: state.showDistant,
              child: RowOfWeaponType(
                size: size,
                ctrl: state,
                weaponTypeList: state.listOfEquip.distanceTypes,
                isTypeDescriptionSelected: state.showDistant,
              ),
            ),
          ],
        );
      },
    );
  }
}

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
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: size.width * 0.2,
          childAspectRatio: 2 / 3,
        ),
        shrinkWrap: true,
        itemCount: weaponTypeList.length,
        itemBuilder: (context, index) {
          var weaponType = weaponTypeList[index];
          return InkWell(
            splashColor: Colors.transparent,
            child: Column(
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
            onTap: () => ctrl.switchWeaponType(weaponType, weaponTypeList),
          );
        },
      ),
    );
  }
}

class WeapomSectionLabel extends StatelessWidget {
  final Size size;
  final EquipController ctrl;
  final String label;
  const WeapomSectionLabel({
    Key? key,
    required this.size,
    required this.ctrl,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size.width * 0.93,
            height: 2,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Chip(
            label: Text(label),
          ),
        ],
      ),
      onTap: () => ctrl.makeWeaponSegmentTrue(label),
    );
  }
}
