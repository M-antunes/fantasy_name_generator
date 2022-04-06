// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../../../controllers/equip_controller.dart';
// import '../../../../shared/constants/phone_sizes.dart';
// import '../../../../shared/themes/app_colors.dart';
// import '../../../../shared/themes/app_text_styles.dart';

// class ChosenEquipDisplay extends StatelessWidget {
//   final String equipType;
//   final Color color;
//   final Widget weapon;
//   final double size;
//   final Icon? icon;
//   const ChosenEquipDisplay({
//     Key? key,
//     required this.equipType,
//     required this.color,
//     required this.weapon,
//     required this.size,
//     this.icon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           equipType,
//           style: AppTextStyle.weaponSelectedText,
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 5),
//         InkWell(
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             margin: const EdgeInsets.symmetric(horizontal: 12),
//             decoration: BoxDecoration(
//               color: Colors.grey[900],
//               borderRadius: BorderRadius.circular(30),
//             ),
//             width: size,
//             height: size,
//             child: weapon,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class EquipOfChoice extends StatelessWidget {
//   final String weaponPic;
//   final double? size;
//   const EquipOfChoice({
//     Key? key,
//     required this.weaponPic,
//     this.size,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SvgPicture.asset(
//       weaponPic,
//       color: AppColors.primary,
//       height: size,
//     );
//   }
// }

// class DualWeildIcon extends StatelessWidget {
//   final EquipController state;

//   const DualWeildIcon({
//     Key? key,
//     required this.state,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//           width: deviceWidth! < 400 ? 30 : 40,
//           child:
//               EquipOfChoice(weaponPic: state.chosenPrimaryWeaponType!.picture),
//         ),
//         SizedBox(
//           width: deviceWidth! < 400 ? 30 : 40,
//           child: EquipOfChoice(
//               weaponPic: state.chosenSecondaryWeaponType!.picture),
//         ),
//       ],
//     );
//   }
// }
