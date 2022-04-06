// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:fantasy_name_generator/controllers/magic_item_controller.dart';

// import '../../../controllers/equip_controller.dart';
// import '../../../shared/constants/phone_sizes.dart';
// import '../../../shared/themes/app_text_styles.dart';
// import 'equip_generation.dart';
// import 'widgets/general_magical_equip_row.dart';

// class MagicEquipSection extends StatelessWidget {
//   const MagicEquipSection({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<MagicItemController>(builder: (context, state, child) {
//       return Padding(
//         padding: EdgeInsets.symmetric(horizontal: deviceWidth! * 0.04),
//         child: Consumer<EquipController>(builder: (context, ctrl, child) {
//           state.character = ctrl.char;
//           ctrl.penaltyToDexApplied = state.penaltyToDexNotApplied;
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: deviceHeight! * 0.01),
//               // const EquipSectionModal(label: "Ability Scores"),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //   children: [
//               //     AtributeTile(
//               //       atribute: "STR",
//               //       value: state.character!.baseAtributes.strength!,
//               //       mod: state.character!.modAtributes.strength!,
//               //     ),
//               //     AtributeTile(
//               //       atribute: "DEX",
//               //       value: state.character!.baseAtributes.dexterity!,
//               //       mod: state.character!.modAtributes.dexterity!,
//               //       penalty: state.penaltyToDexApplied
//               //           ? AppTextStyle.penaltyStyle
//               //           : null,
//               //     ),
//               //     AtributeTile(
//               //       atribute: "CON",
//               //       value: state.character!.baseAtributes.constitution!,
//               //       mod: state.character!.modAtributes.constitution!,
//               //     ),
//               //     AtributeTile(
//               //       atribute: "INT",
//               //       value: state.character!.baseAtributes.intelligence!,
//               //       mod: state.character!.modAtributes.intelligence!,
//               //     ),
//               //     AtributeTile(
//               //       atribute: "WIS",
//               //       value: state.character!.baseAtributes.wisdom!,
//               //       mod: state.character!.modAtributes.wisdom!,
//               //     ),
//               //     AtributeTile(
//               //       atribute: "CHA",
//               //       value: state.character!.baseAtributes.charisma!,
//               //       mod: state.character!.modAtributes.charisma!,
//               //     ),
//               //   ],
//               // ),
//               SizedBox(height: deviceHeight! * 0.01),
//               const EquipSectionModal(label: "Primary Weapon"),
//               SizedBox(height: deviceHeight! * 0.01),
//               Row(
//                 children: [
//                   if (state.character!.charEquip.primaryWeapon!.enchantment !=
//                       null)
//                     Text(
//                         state.character!.charEquip.primaryWeapon!.enchantment!
//                                     .length >
//                                 1
//                             ? "${state.character!.charEquip.primaryWeapon!.enchantment![1].enchant}  "
//                             : "",
//                         style: AppTextStyle.statsLabel),
//                   if (state.character!.charEquip.primaryWeapon!.enchantment ==
//                       null)
//                     Text(
//                         state.character!.charLevel > 1 &&
//                                 state.magicItemsGenerated
//                             ? "Masterwork"
//                             : "Mundane",
//                         style: AppTextStyle.statsLabel),
//                   if (state.character!.charEquip.primaryWeapon!.enchantment ==
//                       null)
//                     const SizedBox(width: 6),
//                   Text("${state.character!.charEquip.primaryWeapon!.name}",
//                       style: AppTextStyle.subTextWhite),
//                   const SizedBox(width: 6),
//                   Text(
//                       state.character!.charEquip.primaryWeapon!.enchantment !=
//                               null
//                           ? state.character!.charEquip.primaryWeapon!
//                               .enchantment![0].enchant
//                           : "",
//                       style: AppTextStyle.subTextWhite),
//                   const SizedBox(width: 15),
//                 ],
//               ),
//               SizedBox(height: deviceHeight! * 0.004),
//               Row(
//                 children: [
//                   Text("Damage ", style: AppTextStyle.statsLabel),
//                   const SizedBox(width: 6),
//                   Text("${state.character!.charEquip.primaryWeapon!.damage}",
//                       style: AppTextStyle.subTextWhite),
//                   const SizedBox(width: 6),
//                   if (state.character!.charEquip.primaryWeapon!.enchantment !=
//                       null)
//                     Text(
//                         state.character!.charEquip.primaryWeapon!.enchantment!
//                                     .length ==
//                                 1
//                             ? ""
//                             : state.character!.charEquip.primaryWeapon!
//                                         .enchantment![1].additionalDiceDamage !=
//                                     null
//                                 ? "${state.character!.charEquip.primaryWeapon!.enchantment![1].additionalDiceDamage}"
//                                 : "",
//                         style: AppTextStyle.subTextWhite),
//                 ],
//               ),
//               if (ctrl.isDualWield)
//                 Column(
//                   children: [
//                     SizedBox(height: deviceHeight! * 0.02),
//                     const EquipSectionModal(label: "Off-hand Weapon"),
//                     SizedBox(height: deviceHeight! * 0.01),
//                     Row(
//                       children: [
//                         if (state.character!.charEquip.secondaryWeapon!
//                                 .enchantment !=
//                             null)
//                           Text(
//                               state.character!.charEquip.secondaryWeapon!
//                                           .enchantment!.length >
//                                       1
//                                   ? "${state.character!.charEquip.secondaryWeapon!.enchantment![1].enchant}  "
//                                   : "",
//                               style: AppTextStyle.statsLabel),
//                         if (state.character!.charEquip.secondaryWeapon!
//                                 .enchantment ==
//                             null)
//                           Text(
//                               state.character!.charLevel > 1 &&
//                                       state.magicItemsGenerated
//                                   ? "Masterwork"
//                                   : "Mundane",
//                               style: AppTextStyle.statsLabel),
//                         if (state.character!.charEquip.secondaryWeapon!
//                                 .enchantment ==
//                             null)
//                           const SizedBox(width: 6),
//                         Text(
//                             "${state.character!.charEquip.secondaryWeapon!.name}",
//                             style: AppTextStyle.subTextWhite),
//                         const SizedBox(width: 6),
//                         Text(
//                             state.character!.charEquip.secondaryWeapon
//                                         ?.enchantment !=
//                                     null
//                                 ? state.character!.charEquip.secondaryWeapon!
//                                     .enchantment![0].enchant
//                                 : "",
//                             style: AppTextStyle.subTextWhite),
//                         const SizedBox(width: 15),
//                       ],
//                     ),
//                     SizedBox(height: deviceHeight! * 0.004),
//                     Row(
//                       children: [
//                         Text("Damage ", style: AppTextStyle.statsLabel),
//                         const SizedBox(width: 6),
//                         Text(
//                             "${state.character!.charEquip.secondaryWeapon!.damage}",
//                             style: AppTextStyle.subTextWhite),
//                         const SizedBox(width: 6),
//                         if (state.character!.charEquip.secondaryWeapon!
//                                 .enchantment !=
//                             null)
//                           Text(
//                               state.character!.charEquip.secondaryWeapon!
//                                           .enchantment!.length >
//                                       1
//                                   ? "${state.character!.charEquip.secondaryWeapon!.enchantment![1].additionalDiceDamage}"
//                                   : "",
//                               style: AppTextStyle.subTextWhite),
//                       ],
//                     ),
//                   ],
//                 ),
//               if (ctrl.chosenShieldType != null &&
//                   ctrl.chosenShieldType?.name != "Empty")
//                 Column(
//                   children: [
//                     SizedBox(height: deviceHeight! * 0.02),
//                     const EquipSectionModal(label: "Shield"),
//                     SizedBox(height: deviceHeight! * 0.01),
//                     Row(
//                       children: [
//                         Text(
//                             state.character!.charEquip.shield!.enchantment !=
//                                     null
//                                 ? "${state.character!.charEquip.shield!.enchantment?.power}"
//                                 : "Mundane",
//                             style: AppTextStyle.statsLabel),
//                         const SizedBox(width: 6),
//                         Text(state.character!.charEquip.shield!.name!,
//                             style: AppTextStyle.subTextWhite),
//                         const SizedBox(width: 10),
//                         Text(
//                             state.character!.charEquip.shield!.enchantment !=
//                                     null
//                                 ? "${state.character!.charEquip.shield!.enchantment?.power}"
//                                 : "",
//                             style: AppTextStyle.subTextWhite),
//                       ],
//                     ),
//                     SizedBox(height: deviceHeight! * 0.004),
//                     Row(
//                       children: [
//                         Text("AC bonus: ", style: AppTextStyle.statsLabel),
//                         Text(
//                             "(${state.character!.charEquip.shield!.defenseBonus!})",
//                             style: AppTextStyle.subTextWhite),
//                         const SizedBox(width: 10),
//                         Text("Check penalty: ", style: AppTextStyle.statsLabel),
//                         Text(
//                             state.character!.charEquip.shield!.checkPenalty! ==
//                                     0
//                                 ? "(0)"
//                                 : "(-${state.character!.charEquip.shield!.checkPenalty!})",
//                             style: AppTextStyle.traitValue),
//                       ],
//                     ),
//                   ],
//                 ),
//               if (ctrl.chosenArmorType!.name != "No armor")
//                 Column(
//                   children: [
//                     SizedBox(height: deviceHeight! * 0.02),
//                     const EquipSectionModal(label: "Armor"),
//                     SizedBox(height: deviceHeight! * 0.01),
//                     Row(
//                       children: [
//                         Text(
//                             state.character!.charEquip.armour!.enchantment !=
//                                     null
//                                 ? ""
//                                 : "Mundane",
//                             style: AppTextStyle.statsLabel),
//                         const SizedBox(width: 6),
//                         Text(state.character!.charEquip.armour!.name!,
//                             style: AppTextStyle.subTextWhite),
//                         const SizedBox(width: 10),
//                         Text(
//                             state.character!.charEquip.armour!.enchantment !=
//                                     null
//                                 ? state.character!.charEquip.armour!
//                                     .enchantment!.enchant
//                                 : "",
//                             style: AppTextStyle.subTextWhite),
//                       ],
//                     ),
//                     SizedBox(height: deviceHeight! * 0.004),
//                     Row(
//                       children: [
//                         Text("AC bonus: ", style: AppTextStyle.statsLabel),
//                         Text(
//                             "(${state.character!.charEquip.armour!.defenseBonus!})",
//                             style: AppTextStyle.subTextWhite),
//                         const SizedBox(width: 6),
//                         Text("Max Dex ", style: AppTextStyle.statsLabel),
//                         const SizedBox(width: 3),
//                         Text(
//                             "(${state.character!.charEquip.armour!.maxDexAllowed!})",
//                             style: AppTextStyle.subTextWhite),
//                       ],
//                     ),
//                   ],
//                 ),
//               if (!state.penaltyToDexNotApplied && ctrl.penaltyToDexApplied)
//                 Column(
//                   children: [
//                     SizedBox(height: deviceHeight! * 0.004),
//                     Row(
//                       children: [
//                         Text("Dex ", style: AppTextStyle.statsLabel),
//                         Text("${state.character!.baseAtributes.dexterity!}  ",
//                             style: AppTextStyle.subTextWhite),
//                         Text("(${state.character!.modAtributes.dexterity!})",
//                             style: AppTextStyle.penaltyStyle),
//                         const SizedBox(width: 6),
//                         Text("Penalty applied",
//                             style: AppTextStyle.penaltyStyleText),
//                       ],
//                     ),
//                   ],
//                 ),
//               if (state.penaltyToDexNotApplied)
//                 Column(
//                   children: [
//                     SizedBox(height: deviceHeight! * 0.004),
//                     Row(
//                       children: [
//                         Text("Dex ", style: AppTextStyle.statsLabel),
//                         Text("${state.character!.baseAtributes.dexterity!}  ",
//                             style: AppTextStyle.subTextWhite),
//                       ],
//                     ),
//                   ],
//                 ),
//               SizedBox(height: deviceHeight! * 0.02),
//               const EquipSectionModal(label: "Emergency Weapon"),
//               SizedBox(height: deviceHeight! * 0.01),
//               Row(
//                 children: [
//                   if (state.character!.charEquip.emergencyWeapon!.enchantment !=
//                       null)
//                     Text(
//                         state.character!.charEquip.emergencyWeapon!.enchantment!
//                                     .length >
//                                 1
//                             ? state.character!.charEquip.emergencyWeapon!
//                                 .enchantment![1].enchant
//                             : "",
//                         style: AppTextStyle.statsLabel),
//                   const SizedBox(width: 6),
//                   if (state.character!.charEquip.emergencyWeapon!.enchantment ==
//                       null)
//                     Row(
//                       children: [
//                         Text(
//                             state.character!.charLevel > 2 &&
//                                     state.magicItemsGenerated
//                                 ? "Masterwork"
//                                 : "Mundane",
//                             style: AppTextStyle.statsLabel),
//                         const SizedBox(width: 6),
//                       ],
//                     ),
//                   Text("${state.character!.charEquip.emergencyWeapon!.name}",
//                       style: AppTextStyle.subTextWhite),
//                   const SizedBox(width: 6),
//                   Text(
//                       state.character!.charEquip.emergencyWeapon!.enchantment ==
//                               null
//                           ? ""
//                           : state.character!.charEquip.emergencyWeapon!
//                                   .enchantment!.isNotEmpty
//                               ? state.character!.charEquip.emergencyWeapon!
//                                   .enchantment![0].enchant
//                               : "",
//                       style: AppTextStyle.subTextWhite),
//                 ],
//               ),
//               SizedBox(height: deviceHeight! * 0.004),
//               Row(
//                 children: [
//                   Text("Damage ", style: AppTextStyle.statsLabel),
//                   const SizedBox(width: 6),
//                   Text("${state.character!.charEquip.emergencyWeapon!.damage}",
//                       style: AppTextStyle.subTextWhite),
//                   const SizedBox(width: 6),
//                   if (state.character!.charEquip.emergencyWeapon!.enchantment !=
//                       null)
//                     Text(
//                         state.character!.charEquip.emergencyWeapon!.enchantment!
//                                     .length >
//                                 1
//                             ? "${state.character!.charEquip.emergencyWeapon!.enchantment![1].additionalDiceDamage}"
//                             : "",
//                         style: AppTextStyle.subTextWhite),
//                 ],
//               ),
//               SizedBox(height: deviceHeight! * 0.015),
//               const EquipSectionModal(label: "General Magic Equipment"),
//               SizedBox(height: deviceHeight! * 0.015),
//               state.magicItemsGenerated
//                   ? ListView.builder(
//                       itemCount:
//                           state.character!.charEquip.wonderousItems!.length,
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         var item =
//                             state.character!.charEquip.wonderousItems![index];
//                         return GeneralMagicalEquipRow(
//                           label: item.type!,
//                           item: item.name!,
//                           description: item.description!,
//                           onTap: () => state.showItemDescription(index),
//                           selected: item.isSelected,
//                         );
//                       })
//                   : const Center(
//                       child: Text(
//                         "?",
//                         style: TextStyle(fontSize: 60, color: Colors.grey),
//                       ),
//                     )

//               // Center(child: AppGenerateButton(onGenerate: () {})),
//             ],
//           );
//         }),
//       );
//     });
//   }
// }
