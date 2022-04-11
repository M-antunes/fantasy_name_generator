import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stats_controller.dart';
import 'package:fantasy_name_generator/shared/widgets/atribute_division.dart';

import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../widgets/char_description_column.dart';

class CombatStats extends StatelessWidget {
  const CombatStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(builder: (context, state, child) {
      return ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AtributeDivision(label: "Defense"),
              Row(
                children: [
                  SizedBox(
                    width: deviceWidth! * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefenseInfo(
                          label: "Hit Points:",
                          value: "${state.char.hitPoints}",
                        ),
                        const SizedBox(height: 3),
                        state.char.physicalStyle.name == "Soldier"
                            ? Column(
                                children: [
                                  DefenseEquipTile(
                                    isMasterWork: state.char.charLevel > 2 &&
                                            state.char.charLevel < 5 &&
                                            state.char.charEquip.shield != null
                                        ? true
                                        : false,
                                    label: "Shield",
                                    name: state.char.charEquip.shield!.name !=
                                            null
                                        ? state.char.charEquip.shield!.name!
                                        : "Shield",
                                    magic: state.char.charEquip.shield
                                                ?.enchantment !=
                                            null
                                        ? state.char.charEquip.shield!
                                            .enchantment![0].enchant
                                        : "",
                                  ),
                                  const SizedBox(height: 3),
                                ],
                              )
                            : SizedBox(height: deviceHeight! * 0.025),
                        if (state.char.battleStyle.name != "Spellcaster" ||
                            state.char.battleStyle.name != "Diplomat")
                          DefenseEquipTile(
                            isMasterWork: state.char.charLevel > 2 &&
                                    state.char.charLevel < 5 &&
                                    state.char.charEquip.armour != null
                                ? true
                                : false,
                            label: "Armor",
                            name: state.char.charEquip.armour!.name != null
                                ? state.char.charEquip.armour!.name!
                                : "Armour",
                            magic:
                                state.char.charEquip.armour!.enchantment != null
                                    ? state.char.charEquip.armour!
                                        .enchantment![0].enchant
                                    : "",
                          ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefenseInfo(
                        length: deviceWidth! * 0.3,
                        label: "Armor Class:",
                        value: "${state.char.combatStats.armourClass}",
                      ),
                      const SizedBox(height: 3),
                      DefenseInfo(
                          label: "Surprise:",
                          value: "${state.char.combatStats.armourSurprise}"),
                      const SizedBox(height: 3),
                      DefenseInfo(
                          label: "Touch:",
                          value: "${state.char.combatStats.armourTouch}"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 3),
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
                  // if (state.char.charEquip.armour != null)
                  //   SizedBox(
                  //     child: state.char.charEquip.armour!.speedPenalty! > 0
                  //         ? Text("armor penalty",
                  //             style: AppTextStyle.penaltyStyleText)
                  //         : SizedBox(),
                  //   )
                ],
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  CharDescriptionText(
                      label: "Base attack bonus:",
                      textValue: "${state.char.combatStats.baseAttackBonus}"),
                  SizedBox(width: deviceWidth! * 0.05),
                  DefenseInfo(
                    length: deviceWidth! * 0.2,
                    label: "CMB:",
                    value: "${state.char.combatStats.combatManeuverBonus}",
                  ),
                  DefenseInfo(
                    length: deviceWidth! * 0.2,
                    label: "CMD",
                    value: "${state.char.combatStats.combatManeuverDefense}",
                  ),
                ],
              ),
              if (state.char.charEquip.meleeWeapon != null)
                Column(
                  children: [
                    WeaponTile(
                      isMasterWork:
                          state.char.charLevel > 2 && state.char.charLevel < 5
                              ? true
                              : false,
                      type: state.char.physicalStyle.name == "Dual-weilder"
                          ? "Main-hand (Dual-weilder)"
                          : "Melee",
                      specificType:
                          state.char.charEquip.meleeWeapon!.type!.wielding,
                      name: state.char.charEquip.meleeWeapon!.name!,
                      magic: state.char.charLevel >= 5
                          ? state.char.charEquip.meleeWeapon!.enchantment!.first
                              .enchant
                          : "",
                      effect: state.char.charEquip.meleeWeapon!.enchantment !=
                                  null &&
                              state.char.charLevel >= 5 &&
                              state.char.charEquip.meleeWeapon!.enchantment!
                                      .length >
                                  1
                          ? state.char.charEquip.meleeWeapon!.enchantment!.last
                              .enchant
                          : "",
                      attack: state.char.charEquip.meleeWeapon != null
                          ? "(${state.char.combatStats.meleeAttack!})"
                          : "",
                      damageValue: state.char.charEquip.meleeWeapon!.damage!,
                      damageBonus: state.char.charEquip.meleeWeapon != null
                          ? "+${state.char.combatStats.meleeDamage!}"
                          : "",
                      extraDamage: state.char.charEquip.meleeWeapon!
                                      .enchantment !=
                                  null &&
                              state.char.charLevel >= 5 &&
                              state.char.charEquip.meleeWeapon!.enchantment!
                                      .length >
                                  1
                          ? "(${state.char.charEquip.meleeWeapon!.enchantment!.last.additionalDiceDamage})"
                          : "",
                    ),
                    if (state.char.physicalStyle.name == "Dual-weilder")
                      WeaponTile(
                        isMasterWork:
                            state.char.charLevel > 2 && state.char.charLevel < 5
                                ? true
                                : false,
                        type: state.char.physicalStyle.name == "Dual-weilder"
                            ? "Off-hand (Dual-weilder)"
                            : "Melee",
                        specificType:
                            state.char.charEquip.meleeWeapon!.type!.wielding,
                        name: state.char.charEquip.meleeWeapon!.name!,
                        magic: state.char.charLevel >= 5
                            ? state.char.charEquip.meleeWeapon!.enchantment!
                                .first.enchant
                            : "",
                        effect: state.char.charEquip.meleeWeapon!.enchantment !=
                                    null &&
                                state.char.charLevel >= 5 &&
                                state.char.charEquip.meleeWeapon!.enchantment!
                                        .length >
                                    1
                            ? state.char.charEquip.meleeWeapon!.enchantment!
                                .last.enchant
                            : "",
                        attack: state.char.charEquip.meleeWeapon != null
                            ? "(${state.char.combatStats.meleeAttack!})"
                            : "",
                        damageValue: state.char.charEquip.meleeWeapon!.damage!,
                        damageBonus: state.char.charEquip.meleeWeapon != null
                            ? "+${state.char.combatStats.meleeDamage!}"
                            : "",
                        extraDamage: state.char.charEquip.meleeWeapon!
                                        .enchantment !=
                                    null &&
                                state.char.charLevel >= 5 &&
                                state.char.charEquip.meleeWeapon!.enchantment!
                                        .length >
                                    1
                            ? "(${state.char.charEquip.meleeWeapon!.enchantment!.last.additionalDiceDamage})"
                            : "",
                      ),
                    WeaponTile(
                      isMasterWork:
                          state.char.charLevel > 2 && state.char.charLevel < 5
                              ? true
                              : false,
                      type: "Range",
                      name: state.char.charEquip.rangeWeapon!.name!,
                      magic: state.char.charLevel >= 5
                          ? state.char.charEquip.rangeWeapon!.enchantment!.first
                              .enchant
                          : "",
                      effect: state.char.charEquip.rangeWeapon!.enchantment !=
                                  null &&
                              state.char.charLevel >= 5 &&
                              state.char.charEquip.rangeWeapon!.enchantment!
                                      .length >
                                  1
                          ? state.char.charEquip.rangeWeapon!.enchantment!.last
                              .enchant
                          : "",
                      attack: state.char.charEquip.rangeWeapon != null
                          ? "(${state.char.combatStats.rangeAttack!})"
                          : "",
                      damageValue: state.char.charEquip.rangeWeapon!.damage!,
                      damageBonus: state.char.charEquip.rangeWeapon != null
                          ? "+${state.char.combatStats.rangeDamage!}"
                          : "",
                      extraDamage: state.char.charEquip.rangeWeapon!
                                      .enchantment !=
                                  null &&
                              state.char.charLevel >= 5 &&
                              state.char.charEquip.rangeWeapon!.enchantment!
                                      .length >
                                  1
                          ? "(${state.char.charEquip.rangeWeapon!.enchantment!.last.additionalDiceDamage})"
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
          ),
        ],
      );
    });
  }
}

class DefenseEquipTile extends StatelessWidget {
  final String label;
  final String name;
  final String? magic;
  final bool isMasterWork;
  const DefenseEquipTile({
    Key? key,
    required this.label,
    required this.name,
    this.magic,
    this.isMasterWork = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: AppTextStyle.statsLabel),
        const SizedBox(width: 4),
        Text(name,
            style: AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300])),
        const SizedBox(width: 4),
        Text(isMasterWork ? "(mw)" : "",
            style: AppTextStyle.statsLabel.copyWith(
                color: Colors.grey[400], fontStyle: FontStyle.italic)),
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
  final String? specificType;
  final String name;
  final String magic;
  final String effect;
  final bool isMasterWork;
  final String attack;
  final String damageValue;
  final String damageBonus;
  final String? extraDamage;
  const WeaponTile({
    Key? key,
    required this.type,
    this.specificType,
    required this.name,
    required this.magic,
    required this.effect,
    this.isMasterWork = false,
    required this.attack,
    required this.damageValue,
    required this.damageBonus,
    this.extraDamage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientLabel(label: type, label2: specificType),
        RichText(
            text: TextSpan(
                style:
                    AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300]),
                children: [
              TextSpan(
                  text: effect != "" ? "$effect  " : "",
                  style: const TextStyle(fontStyle: FontStyle.italic)),
              TextSpan(text: "$name  "),
              TextSpan(
                  text: isMasterWork ? "(mw)  " : "",
                  style: AppTextStyle.statsLabel.copyWith(
                      color: Colors.grey[400], fontStyle: FontStyle.italic)),
              TextSpan(text: magic != "" ? "$magic  " : ""),
              TextSpan(text: attack),
            ])),
        const SizedBox(height: 3),
        Row(
          children: [
            Text("Damage:", style: AppTextStyle.statsLabel),
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
  final String? label2;
  const GradientLabel({
    Key? key,
    required this.label,
    this.label2,
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
        child: Row(
          children: [
            Text(" $label",
                style:
                    AppTextStyle.selectRace.copyWith(color: Colors.grey[400])),
            Text(label2 != null ? "  ($label2)" : "",
                style:
                    AppTextStyle.statsLabel.copyWith(color: Colors.grey[400])),
          ],
        ));
  }
}
