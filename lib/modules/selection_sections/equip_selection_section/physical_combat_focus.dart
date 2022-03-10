import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class PhysicalCombatFocus extends StatelessWidget {
  final CharModel char;
  final EquipController ctrl;
  const PhysicalCombatFocus({
    Key? key,
    required this.char,
    required this.ctrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(height: size.height * 0.07),
        Text("Choose your physical combat focus",
            style: AppTextStyle.subTextGreyPlusSize),
        SizedBox(height: size.height * 0.07),
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 10 / 8,
              crossAxisCount: 2,
            ),
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var combatStyle = ctrl.listOfClasses.fightingStyle[index];
              return InkWell(
                splashColor: Colors.transparent,
                child: FightStyleChoice(
                  fightStyle: combatStyle.key,
                  pic: combatStyle.value.value,
                  color: combatStyle.value.key == true
                      ? AppColors.primary
                      : Colors.white70,
                ),
                onTap: () => ctrl.switchCombatStyle(combatStyle),
              );
            })
      ],
    );
  }
}

class FightStyleChoice extends StatelessWidget {
  final String fightStyle;
  final String pic;
  final Color color;
  const FightStyleChoice({
    Key? key,
    required this.fightStyle,
    required this.pic,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            fightStyle,
            style: AppTextStyle.weaponSelectedText,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(30),
            ),
            height: deviceWidth! < 400 ? 100 : 135,
            width: deviceWidth! < 400 ? 100 : 135,
            child: SvgPicture.asset(
              pic,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
