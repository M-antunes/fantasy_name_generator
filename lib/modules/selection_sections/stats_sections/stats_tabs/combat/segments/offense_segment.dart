import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../controllers/stats_controller.dart';
import '../../../../../../shared/constants/phone_sizes.dart';
import '../../../widgets/atribute_division.dart';
import '../../../widgets/char_description_text.dart';
import '../widgets/combat_info.dart';
import '../widgets/weapon_tile.dart';

class OffenseSegment extends StatelessWidget {
  const OffenseSegment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(builder: (context, state, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AtributeDivision(label: "Offense"),
          Row(
            children: [
              CombatInfo(
                label: "Initiative:",
                value: "${state.char.combatStats.initiative}",
              ),
              SizedBox(width: deviceWidth! * 0.03),
              CombatInfo(
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
                label: "Base attack bonus:  ",
                textValue: "${state.char.combatStats.baseAttackBonus}",
              ),
              SizedBox(width: deviceWidth! * 0.05),
              CombatInfo(
                length: deviceWidth! * 0.2,
                label: "CMB:",
                value: "${state.char.combatStats.combatManeuverBonus}",
              ),
              CombatInfo(
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
                  effect:
                      state.char.charEquip.meleeWeapon!.enchantment != null &&
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
                  extraDamage: state.char.charEquip.meleeWeapon!.enchantment !=
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
                        ? state.char.charEquip.meleeWeapon!.enchantment!.first
                            .enchant
                        : "",
                    effect:
                        state.char.charEquip.meleeWeapon!.enchantment != null &&
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
                    extraDamage: state
                                    .char.charEquip.meleeWeapon!.enchantment !=
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
                  effect:
                      state.char.charEquip.rangeWeapon!.enchantment != null &&
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
                  extraDamage: state.char.charEquip.rangeWeapon!.enchantment !=
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
      );
    });
  }
}
