import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stats_controller.dart';
import 'package:fantasy_name_generator/shared/widgets/atribute_division.dart';

import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../widgets/char_description_column.dart';
import '../widgets/defense_info.dart';

class CombatStats extends StatelessWidget {
  const CombatStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(builder: (context, state, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AtributeDivision(label: "Defense"),
          DefenseInfo(
            length: deviceWidth! * 0.35,
            label: "Hit Points:",
            value: "${state.char.hitPoints}",
          ),
          const SizedBox(height: 3),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  if (state.char.physicalStyle.name == "Soldier")
                    Column(
                      children: [
                        DefenseEquipTile(name: "Shield name", magic: ""),
                        const SizedBox(height: 3),
                      ],
                    ),
                  if (state.char.battleStyle.name != "Spellcaster" ||
                      state.char.battleStyle.name != "Diplomat")
                    DefenseEquipTile(name: "Armor name", magic: ""),
                ],
              ),
              DefenseInfo(
                label: "Armor Class:",
                value: "0",
                length: deviceWidth! * 0.3,
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: const [
              DefenseInfo(label: "Touch:", value: "0"),
              SizedBox(width: 15),
              DefenseInfo(label: "Surprise:", value: "0"),
            ],
          ),
          const GradientLabel(label: "Resistances"),
          Row(
            children: [
              DefenseInfo(
                label: "Fortitude:",
                value: "${state.char.resistances.fortitude!}",
              ),
              SizedBox(width: deviceWidth! * 0.03),
              DefenseInfo(
                label: "Reflex:",
                value: "${state.char.resistances.reflex!}",
              ),
              SizedBox(width: deviceWidth! * 0.03),
              DefenseInfo(
                label: "Will:",
                value: "${state.char.resistances.will!}",
              ),
            ],
          ),
          const AtributeDivision(label: "Offense"),
          Row(
            children: [
              DefenseInfo(
                label: "Initiative:",
                value: "${state.char.combatStats.initiative}",
              ),
              SizedBox(width: deviceWidth! * 0.03),
              DefenseInfo(
                label: "Speed:",
                value: "${state.char.charRace.speed} ft.",
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              const CharDescriptionText(
                  label: "Base attack bonus:", textValue: "0"),
              SizedBox(width: deviceWidth! * 0.05),
              DefenseInfo(
                length: deviceWidth! * 0.2,
                label: "CMB:",
                value: "0",
              ),
              DefenseInfo(
                length: deviceWidth! * 0.2,
                label: "CMD",
                value: "0",
              ),
            ],
          ),
          if (state.char.charEquip.meleeWeapon != null)
            Column(
              children: [
                WeaponTile(
                  type: "Melee",
                  name: state.char.charEquip.meleeWeapon!.name!,
                  magic: state.char.charEquip.meleeWeapon!.enchantment != null
                      ? state.char.charEquip.meleeWeapon!.enchantment!.first
                          .enchant
                      : "",
                  effect:
                      state.char.charEquip.meleeWeapon!.enchantment != null &&
                              state.char.charEquip.meleeWeapon!.enchantment!
                                      .length >
                                  1
                          ? state.char.charEquip.meleeWeapon!.enchantment!.last
                              .enchant
                          : "",
                  attack: "(Attack value)",
                  damageValue: state.char.charEquip.meleeWeapon!.damage!,
                  damageBonus: "+bonus",
                  extraDamage:
                      state.char.charEquip.meleeWeapon!.enchantment != null &&
                              state.char.charEquip.meleeWeapon!.enchantment!
                                      .length >
                                  1
                          ? state.char.charEquip.meleeWeapon!.enchantment!.last
                              .additionalDiceDamage
                          : "",
                ),
                WeaponTile(
                  type: "Range",
                  name: state.char.charEquip.rangeWeapon!.name!,
                  magic: state.char.charEquip.rangeWeapon!.enchantment != null
                      ? state.char.charEquip.rangeWeapon!.enchantment!.first
                          .enchant
                      : "",
                  effect:
                      state.char.charEquip.rangeWeapon!.enchantment != null &&
                              state.char.charEquip.rangeWeapon!.enchantment!
                                      .length >
                                  1
                          ? state.char.charEquip.rangeWeapon!.enchantment!.last
                              .enchant
                          : "",
                  attack: "(Attack value)",
                  damageValue: state.char.charEquip.rangeWeapon!.damage!,
                  damageBonus: "+bonus",
                  extraDamage:
                      state.char.charEquip.rangeWeapon!.enchantment != null &&
                              state.char.charEquip.rangeWeapon!.enchantment!
                                      .length >
                                  1
                          ? state.char.charEquip.rangeWeapon!.enchantment!.last
                              .additionalDiceDamage
                          : "",
                ),
              ],
            ),
          if (state.char.charEquip.meleeWeapon == null)
            Column(
              children: const [
                WeaponTile(
                    type: "Melee",
                    name: "Weapon Name",
                    effect: "",
                    magic: "",
                    attack: "(Attack value)",
                    damageValue: "damage",
                    damageBonus: "+bonus"),
                WeaponTile(
                    type: "Range",
                    name: "Weapon Name",
                    effect: "",
                    magic: "",
                    attack: "(Attack value)",
                    damageValue: "damage",
                    damageBonus: "+bonus"),
              ],
            ),
        ],
      );
    });
  }
}

class DefenseEquipTile extends StatelessWidget {
  final String name;
  final String? magic;
  const DefenseEquipTile({
    Key? key,
    required this.name,
    this.magic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(name,
            style: AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300])),
        const SizedBox(width: 4),
        Text(magic ?? "",
            style: AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300])),
        const SizedBox(width: 10),
      ],
    );
  }
}

class DefenseInfo extends StatelessWidget {
  final String label;
  final String value;
  final double? length;
  const DefenseInfo({
    Key? key,
    required this.label,
    required this.value,
    this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: length ?? deviceWidth! * 0.28,
      child: Row(
        children: [
          Text(label, style: AppTextStyle.statsLabel),
          const SizedBox(width: 10),
          Text(
            value,
            style: AppTextStyle.modefier,
          ),
        ],
      ),
    );
  }
}

class WeaponTile extends StatelessWidget {
  final String type;
  final String name;
  final String magic;
  final String effect;
  final String attack;
  final String damageValue;
  final String damageBonus;
  final String? extraDamage;
  const WeaponTile({
    Key? key,
    required this.type,
    required this.name,
    required this.magic,
    required this.effect,
    required this.attack,
    required this.damageValue,
    required this.damageBonus,
    this.extraDamage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GradientLabel(label: type),
        Row(
          children: [
            Text(effect,
                style: AppTextStyle.subTextWhite.copyWith(
                    color: Colors.grey[300], fontStyle: FontStyle.italic)),
            effect != "" ? const SizedBox(width: 6) : const SizedBox(),
            Text(name,
                style: AppTextStyle.subTextWhite
                    .copyWith(color: Colors.grey[300])),
            magic != "" ? const SizedBox(width: 6) : const SizedBox(),
            Text(magic,
                style: AppTextStyle.subTextWhite
                    .copyWith(color: Colors.grey[300])),
            const SizedBox(width: 10),
            Text(attack,
                style: AppTextStyle.subTextWhite
                    .copyWith(color: Colors.grey[300])),
          ],
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            Text("Damage:", style: AppTextStyle.subTextGrey),
            const SizedBox(width: 4),
            Text(damageValue,
                style: AppTextStyle.subTextWhite
                    .copyWith(color: Colors.grey[300])),
            const SizedBox(width: 4),
            Text(damageBonus,
                style: AppTextStyle.subTextWhite
                    .copyWith(color: Colors.grey[300])),
            const SizedBox(width: 4),
            Text(extraDamage ?? "",
                style: AppTextStyle.subTextWhite
                    .copyWith(color: Colors.grey[300])),
          ],
        ),
      ],
    );
  }
}

class GradientLabel extends StatelessWidget {
  final String label;
  const GradientLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey[900]!,
              Colors.transparent,
            ],
          ),
        ),
        padding: const EdgeInsets.all(2),
        child: Text(" $label",
            style: AppTextStyle.selectRace.copyWith(color: Colors.grey[400])));
  }
}
