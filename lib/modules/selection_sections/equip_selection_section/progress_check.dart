// import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:fantasy_name_generator/controllers/char_controller.dart';

// import '../../../shared/themes/app_text_styles.dart';
// import '../../../shared/widgets/atribute_division.dart';
// import '../char_selection_sections/widgets/defense_info.dart';
// import '../char_selection_sections/widgets/stats_description_column.dart';

// class ProgressCheck extends StatefulWidget {
//   const ProgressCheck({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ProgressCheck> createState() => _ProgressCheckState();
// }

// class _ProgressCheckState extends State<ProgressCheck> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Consumer<CharController>(builder: (context, state, child) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 5),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                   style: AppTextStyle.subTextGrey,
//                   children: [
//                     const TextSpan(
//                       text: "The  ",
//                     ),
//                     TextSpan(
//                         text: state.cha.charClass.name,
//                         style: AppTextStyle.subTextWhite),
//                     const TextSpan(
//                       text: "  of level  ",
//                     ),
//                     TextSpan(
//                         text: "${state.cha.charLevel}, ",
//                         style: AppTextStyle.subTextWhite),
//                     const TextSpan(
//                       text: " named  ",
//                     ),
//                     TextSpan(
//                         text: state.cha.charName.fullName,
//                         style: AppTextStyle.subTextWhite),
//                     const TextSpan(
//                       text: "  has no equipment so far.",
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: size.height * 0.01),
//               const AtributeDivision(
//                 label: "ABILITY SCORES  (base / modifier)",
//                 label2: "These values might be altered depending on equipment",
//               ),
//               Row(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: size.width * 0.44,
//                         child: StatsDescriptionColumn(
//                           labeltop: "Strength:",
//                           labelBottom: "Dexterity:",
//                           textValueTop: state.cha.baseAtributes.strength!,
//                           textValueBottom: state.cha.baseAtributes.dexterity!,
//                           modTop: state.cha.modAtributes.strength!,
//                           modBottom: state.cha.modAtributes.dexterity!,
//                         ),
//                       ),
//                       SizedBox(
//                         width: size.width * 0.44,
//                         child: StatsDescriptionText(
//                           label: "Constitution:",
//                           textValue: state.cha.baseAtributes.constitution!,
//                           modValue: state.cha.modAtributes.constitution!,
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(width: size.width * 0.02),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: size.width * 0.44,
//                         child: StatsDescriptionColumn(
//                           labeltop: "Intelligence:",
//                           labelBottom: "Wisdom:",
//                           textValueTop: state.cha.baseAtributes.intelligence!,
//                           textValueBottom: state.cha.baseAtributes.wisdom!,
//                           modTop: state.cha.modAtributes.intelligence!,
//                           modBottom: state.cha.modAtributes.wisdom!,
//                         ),
//                       ),
//                       SizedBox(
//                         width: size.width * 0.44,
//                         child: StatsDescriptionText(
//                           label: "Charisma:",
//                           textValue: state.cha.baseAtributes.charisma!,
//                           modValue: state.cha.modAtributes.charisma!,
//                         ),
//                       ),
//                       SizedBox(height: size.height * 0.006),
//                     ],
//                   ),
//                 ],
//               ),
//               const AtributeDivision(
//                 label: "COMBAT",
//                 label2: "These values might be altered depending on equipment",
//               ),
//               Row(
//                 children: [
//                   DefenseInfo(
//                     label: "HP:",
//                     value: state.cha.hitPoints,
//                   ),
//                   SizedBox(width: size.width * 0.03),
//                   DefenseInfo(
//                     label: "Initiative",
//                     value: state.cha.modAtributes.dexterity!,
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   DefenseInfo(
//                     label: "FORT:",
//                     value: state.cha.resistances.fortitude!,
//                   ),
//                   SizedBox(width: size.width * 0.03),
//                   DefenseInfo(
//                     label: "REF:",
//                     value: state.cha.resistances.reflex!,
//                   ),
//                   SizedBox(width: size.width * 0.03),
//                   DefenseInfo(
//                     label: "WILL:",
//                     value: state.cha.resistances.will!,
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   DefenseInfo(
//                     label: "AC:",
//                     value: state.cha.combatStats.armourClass!,
//                   ),
//                   SizedBox(width: size.width * 0.03),
//                   DefenseInfo(
//                     label: "Touch:",
//                     value: state.cha.combatStats.armourTouch!,
//                   ),
//                   SizedBox(width: size.width * 0.03),
//                   DefenseInfo(
//                     label: "Surp:",
//                     value: state.cha.combatStats.armourSurprise!,
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   DefenseInfo(
//                     label: "BAB:",
//                     value: state.cha.combatStats.baseAttackBonus!,
//                   ),
//                   SizedBox(width: size.width * 0.03),
//                   DefenseInfo(
//                     label: "CMB:",
//                     value: state.cha.combatStats.combatManeuverBonus!,
//                   ),
//                   SizedBox(width: size.width * 0.03),
//                   DefenseInfo(
//                     label: "CMD:",
//                     value: state.cha.combatStats.combatManeuverDefense!,
//                   ),
//                 ],
//               ),
//               SizedBox(height: size.height * 0.015),
//               Row(
//                 children: [
//                   Text("Click", style: AppTextStyle.subTextGrey),
//                   TextButton(
//                       child: const Text(
//                         "HERE",
//                         style: TextStyle(color: AppColors.primaryGold),
//                       ),
//                       onPressed: () {
//                         showStartingOverConfirmation(context, state);
//                       }),
//                   Text("to start over", style: AppTextStyle.subTextGrey),
//                 ],
//               ),
//               Text("Or click next to start equipment generation",
//                   style: AppTextStyle.subTextGrey),
//               SizedBox(height: size.height * 0.01),
//             ],
//           ),
//         );
//       }),
//     );
//   }

//   Future<dynamic> showStartingOverConfirmation(
//       BuildContext context, CharController state) {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: const Center(
//               child: Text(
//                 "ATENTION!",
//                 style: TextStyle(
//                   color: AppColors.primaryGold,
//                 ),
//               ),
//             ),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                     "If you start over, the ${state.cha.charClass.name} ${state.cha.charName.fullName}, will be lost forever.",
//                     style: AppTextStyle.subTextGrey,
//                     textAlign: TextAlign.center),
//                 Text("Is that what you desire?",
//                     style: AppTextStyle.subTextGrey),
//               ],
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   state.startCharAllOver();
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text(
//                   'YES',
//                   style: TextStyle(color: AppColors.primary),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text(
//                   'NO',
//                   style: TextStyle(color: Colors.white70),
//                 ),
//               ),
//             ],
//           );
//         });
//   }
// }
