// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:fantasy_name_generator/controllers/equip_controller.dart';
// import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
// import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
// import 'package:fantasy_name_generator/shared/widgets/app_generate_button.dart';

// import '../../../shared/constants/phone_sizes.dart';

// class EquipGeneration extends StatelessWidget {
//   final VoidCallback onGenerate;
//   const EquipGeneration({
//     Key? key,
//     required this.onGenerate,
//   }) : super(key: key);

//   @override
//   Widget build(context) {
//     return Consumer<EquipController>(builder: (context, state, child) {
//       return Padding(
//         padding: EdgeInsets.symmetric(horizontal: deviceWidth! * 0.04),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: deviceHeight! * 0.01),
//             const EquipSectionModal(label: "Ability Scores"),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AtributeTile(
//                   atribute: "STR",
//                   value: state.char.baseAtributes.strength!,
//                   mod: state.char.modAtributes.strength!,
//                 ),
//                 AtributeTile(
//                   atribute: "DEX",
//                   value: state.char.baseAtributes.dexterity!,
//                   mod: state.char.modAtributes.dexterity!,
//                   penalty: state.penaltyToDexApplied
//                       ? AppTextStyle.penaltyStyle
//                       : null,
//                 ),
//                 AtributeTile(
//                   atribute: "CON",
//                   value: state.char.baseAtributes.constitution!,
//                   mod: state.char.modAtributes.constitution!,
//                 ),
//                 AtributeTile(
//                   atribute: "INT",
//                   value: state.char.baseAtributes.intelligence!,
//                   mod: state.char.modAtributes.intelligence!,
//                 ),
//                 AtributeTile(
//                   atribute: "WIS",
//                   value: state.char.baseAtributes.wisdom!,
//                   mod: state.char.modAtributes.wisdom!,
//                 ),
//                 AtributeTile(
//                   atribute: "CHA",
//                   value: state.char.baseAtributes.charisma!,
//                   mod: state.char.modAtributes.charisma!,
//                 ),
//               ],
//             ),
//             Center(
//               child: AppGenerateButton(
//                   icon: state.equipGenerated
//                       ? const Icon(Icons.delete_forever, size: 40)
//                       : null,
//                   onGenerate: onGenerate),
//             ),
//             SizedBox(height: deviceHeight! * 0.01),
//             if (!state.equipGenerated)
//               Text(
//                 "The Equpment generated will be in accordance to the previous choices and of common type. Advance to next section to make it magical and more powerfull according to ${state.char.charName.fullName} level.",
//                 style: AppTextStyle.subTextGrey,
//                 textAlign: TextAlign.center,
//               ),
//             if (state.equipGenerated)
//               Column(
//                 children: [
//                   SizedBox(height: deviceHeight! * 0.01),
//                   WeaponGeneratedDisplay(
//                     label: "Primary Weapon",
//                     name: state.char.charEquip.primaryWeapon!.name!,
//                     attack: state.char.combatStats.primaryAttack!,
//                     damage: state.char.combatStats.primaryDamage!,
//                     critical: state.char.charEquip.primaryWeapon!.critical!,
//                     damageType: state.char.charEquip.primaryWeapon!.damageType!,
//                   ),
//                   if (state.isDualWield || state.cantChooseTwoHandedAnymore)
//                     Column(
//                       children: [
//                         SizedBox(height: deviceHeight! * 0.01),
//                         WeaponGeneratedDisplay(
//                           label: "Off-hand Weapon",
//                           name: state.char.charEquip.secondaryWeapon!.name!,
//                           attack: state.char.combatStats.secundaryAttack!,
//                           damage: state.char.combatStats.secundaryDamage!,
//                           critical:
//                               state.char.charEquip.secondaryWeapon!.critical!,
//                           damageType:
//                               state.char.charEquip.secondaryWeapon!.damageType!,
//                         ),
//                         SizedBox(height: deviceHeight! * 0.01),
//                       ],
//                     ),
//                   if (state.chosenShieldType != null)
//                     Column(
//                       children: [
//                         SizedBox(height: deviceHeight! * 0.02),
//                         const EquipSectionModal(label: "Shield"),
//                         SizedBox(height: deviceHeight! * 0.01),
//                         Row(
//                           children: [
//                             Text(state.char.charEquip.shield!.name!,
//                                 style: AppTextStyle.subTextWhite),
//                             const SizedBox(width: 10),
//                             Text(
//                                 "(${state.char.charEquip.shield!.defenseBonus!})",
//                                 style: AppTextStyle.subTextWhite),
//                             const SizedBox(width: 10),
//                             Text("Check penalty: ",
//                                 style: AppTextStyle.statsLabel),
//                             Text(
//                                 state.char.charEquip.shield!.checkPenalty! == 0
//                                     ? "(0)"
//                                     : "(-${state.char.charEquip.shield!.checkPenalty!})",
//                                 style: AppTextStyle.traitValue),
//                           ],
//                         ),
//                       ],
//                     ),
//                   SizedBox(height: deviceHeight! * 0.01),
//                   const EquipSectionModal(label: "Armor"),
//                   SizedBox(height: deviceHeight! * 0.01),
//                   Row(
//                     children: [
//                       Text("AC ", style: AppTextStyle.statsLabel),
//                       const SizedBox(width: 6),
//                       Text("${state.char.combatStats.armourClass}",
//                           style: AppTextStyle.subTextWhite),
//                       const SizedBox(width: 15),
//                       Text("Touch ", style: AppTextStyle.statsLabel),
//                       const SizedBox(width: 6),
//                       Text("${state.char.combatStats.armourTouch}",
//                           style: AppTextStyle.subTextWhite),
//                       const SizedBox(width: 15),
//                       Text("Surprise ", style: AppTextStyle.statsLabel),
//                       const SizedBox(width: 6),
//                       Text("${state.char.combatStats.armourSurprise}",
//                           style: AppTextStyle.subTextWhite),
//                     ],
//                   ),
//                   SizedBox(height: deviceHeight! * 0.01),
//                   Row(
//                     children: [
//                       Text(state.char.charEquip.armour!.name!,
//                           style: AppTextStyle.subTextWhite),
//                       const SizedBox(width: 3),
//                       Text("(${state.char.charEquip.armour!.defenseBonus!})",
//                           style: AppTextStyle.subTextWhite),
//                       const SizedBox(width: 10),
//                       Text("Max dex: ", style: AppTextStyle.statsLabel),
//                       Text("(${state.char.charEquip.armour!.maxDexAllowed!})",
//                           style: AppTextStyle.subTextWhite),
//                       const SizedBox(width: 6),
//                       if (state.penaltyToDexApplied)
//                         Text("Penalty applied",
//                             style: AppTextStyle.penaltyStyleText),
//                     ],
//                   ),
//                   SizedBox(height: deviceHeight! * 0.01),
//                   Row(
//                     children: [
//                       Text("Check penalty: ", style: AppTextStyle.statsLabel),
//                       Text(
//                           state.char.charEquip.armour!.checkPenalty! == 0
//                               ? "(0)"
//                               : "(-${state.char.charEquip.armour!.checkPenalty!})",
//                           style: AppTextStyle.subTextWhite),
//                     ],
//                   ),
//                   SizedBox(height: deviceHeight! * 0.01),
//                   WeaponGeneratedDisplay(
//                     label: "Emergency Weapon",
//                     name: state.char.charEquip.emergencyWeapon!.name!,
//                     attack: state.char.combatStats.emergencyAttack!,
//                     damage: state.char.combatStats.emergencyDamage!,
//                     critical: state.char.charEquip.emergencyWeapon!.critical!,
//                     damageType:
//                         state.char.charEquip.emergencyWeapon!.damageType!,
//                   ),
//                 ],
//               ),
//             SizedBox(height: deviceHeight! * 0.01),
//           ],
//         ),
//       );
//     });
//   }
// }

// class WeaponGeneratedDisplay extends StatelessWidget {
//   final String label;
//   final String name;
//   final String attack;
//   final String damage;
//   final String critical;
//   final String damageType;
//   const WeaponGeneratedDisplay({
//     Key? key,
//     required this.label,
//     required this.name,
//     required this.attack,
//     required this.damage,
//     required this.critical,
//     required this.damageType,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: deviceHeight! * 0.01),
//         EquipSectionModal(label: label),
//         SizedBox(height: deviceHeight! * 0.01),
//         Row(
//           children: [
//             Text(name, style: AppTextStyle.subTextWhite),
//             const SizedBox(width: 10),
//             Text(attack, style: AppTextStyle.subTextWhite),
//           ],
//         ),
//         SizedBox(height: deviceHeight! * 0.01),
//         Row(
//           children: [
//             Text("Damage: ", style: AppTextStyle.statsLabel),
//             Text(damage, style: AppTextStyle.traitValue),
//             const SizedBox(width: 15),
//             Text("Critical: ", style: AppTextStyle.statsLabel),
//             Text(critical, style: AppTextStyle.traitValue),
//           ],
//         ),
//         SizedBox(height: deviceHeight! * 0.01),
//         Row(
//           children: [
//             Text("Damage type: ", style: AppTextStyle.statsLabel),
//             Text(damageType, style: AppTextStyle.traitValue),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class EquipSectionModal extends StatelessWidget {
//   final String label;
//   const EquipSectionModal({
//     Key? key,
//     required this.label,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Container(
//         height: deviceHeight! * 0.03,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(colors: [
//           AppColors.primaryText0,
//           Colors.transparent,
//         ], begin: Alignment.centerLeft, end: Alignment.bottomRight)),
//         child: Align(
//             alignment: Alignment.centerLeft,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 4),
//               child: Text(label, style: AppTextStyle.subTextWhite),
//             )),
//       ),
//     );
//   }
// }

// class AtributeTile extends StatelessWidget {
//   final String atribute;
//   final int value;
//   final int mod;
//   final TextStyle? penalty;
//   const AtributeTile({
//     Key? key,
//     required this.atribute,
//     required this.value,
//     required this.mod,
//     this.penalty,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: deviceHeight! * 0.07,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(atribute, style: AppTextStyle.subTextWhitePlusSize),
//           Row(
//             children: [
//               Text("$value  ", style: AppTextStyle.subTextGrey),
//               Text("($mod)", style: penalty ?? AppTextStyle.subTextWhite),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
