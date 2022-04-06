// import 'package:fantasy_name_generator/controllers/equip_controller.dart';
// import 'package:fantasy_name_generator/controllers/magic_item_controller.dart';
// import 'package:fantasy_name_generator/models/char_model.dart';
// import 'package:fantasy_name_generator/modules/selection_sections/equip_selection_section/combat_gear_section.dart';
// import 'package:fantasy_name_generator/modules/selection_sections/equip_selection_section/equip_generation.dart';
// import 'package:fantasy_name_generator/shared/data/wonderous_items_data.dart';
// import 'package:fantasy_name_generator/shared/widgets/app_generate_button.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:fantasy_name_generator/modules/main_screens/widgets/progression_bar.dart';
// import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
// import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';
// import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';

// import '../../shared/constants/phone_sizes.dart';
// import '../../shared/themes/app_text_styles.dart';
// import '../selection_sections/equip_selection_section/choice_section.dart';
// import '../selection_sections/equip_selection_section/magic_equip_section.dart';
// import 'widgets/equip_selection_label.dart';

// class EquipDevelopMentPage extends StatefulWidget {
//   const EquipDevelopMentPage({Key? key}) : super(key: key);

//   @override
//   _EquipDevelopMentPageState createState() => _EquipDevelopMentPageState();
// }

// class _EquipDevelopMentPageState extends State<EquipDevelopMentPage> {
//   late final EquipController equipController;

//   @override
//   void initState() {
//     equipController = context.read<EquipController>();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     CharModel char = ModalRoute.of(context)!.settings.arguments as CharModel;
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//         child: Consumer<EquipController>(builder: (context, state, child) {
//           state.char = char;
//           return ListView(
//             children: [
//               EquipSelectionLabel(
//                   char: char,
//                   size: size,
//                   label: state.creationStage == 7
//                       ? "Equipment - Auto generate"
//                       : state.creationStage == 8
//                           ? "Equipment - Combat Gear"
//                           : state.creationStage == 9
//                               ? "Equipment - Apply Magic"
//                               : state.creationStage == 10
//                                   ? "Equipment - "
//                                   : state.creationStage == 11
//                                       ? "Equipment - Stats"
//                                       : state.creationStage == 12
//                                           ? "Equipment - Basic features ready"
//                                           : ''),
//               EquipProgressionBar(
//                 controller: state,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(" (${char.charRace.name})",
//                         style: AppTextStyle.subTextGreyPlusSize),
//                     SizedBox(
//                       height: deviceHeight! * 0.03,
//                       child: FittedBox(
//                         fit: BoxFit.fitHeight,
//                         child: Text(" (${char.charName.fullName})",
//                             style: AppTextStyle.subTextGreyPlusSize),
//                       ),
//                     ),
//                     Text(" (${char.charClass.name})",
//                         style: AppTextStyle.subTextGreyPlusSize),
//                   ],
//                 ),
//               ),
//               if (state.creationStage == 7) const ChoiceSection(),
//               if (state.creationStage == 8) const CombatGearSection(),
//               if (state.creationStage == 9) const MagicEquipSection(),
//             ],
//           );
//         }),
//       ),
//       bottomNavigationBar:
//           Consumer<EquipController>(builder: (context, state, child) {
//         return Padding(
//           padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 4),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   AppAnimatedButton(
//                       label: "Previous",
//                       onTap: () {
//                         if (state.creationStage == 7) {
//                           Navigator.of(context).pop();
//                         } else {
//                           state.retreatCreationStage();
//                         }
//                       }),
//                   if (state.creationStage == 8 && state.hasChosenArmor)
//                     AppGenerateButton(
//                       icon: state.equipGenerated
//                           ? const Icon(Icons.delete_forever, size: 40)
//                           : null,
//                       onGenerate: state.equipGenerated
//                           ? () => state.resetEquipStats()
//                           : () => state.generateEquip(),
//                     ),
//                   if (state.creationStage == 9)
//                     Consumer<MagicItemController>(
//                         builder: (context, ctrl, child) {
//                       return AppGenerateButton(
//                           icon: ctrl.magicItemsGenerated
//                               ? const Icon(Icons.delete_forever, size: 35)
//                               : null,
//                           onGenerate: ctrl.magicItemsGenerated
//                               ? () {
//                                   ctrl.resetItems();
//                                   state.updateMagicEquipGenerated();
//                                 }
//                               : () {
//                                   ctrl.generateMagicEquip();
//                                   state.updateMagicEquipGenerated();
//                                 });
//                     }),
//                   AppAnimatedButton(
//                       onTap: () => buttonFunction(state, context)),
//                 ],
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }

//   void buttonFunction(EquipController state, BuildContext context) {
//     var text = state.activateNextButton();
//     if (text != null) {
//       callMessageSnackbar(context, text, AppColors.warningColor, null);
//     }
//   }
// }
