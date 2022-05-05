// import 'package:fantasy_name_generator/controllers/stage_controller/char_controller.dart';
// import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';

// import '../../../../shared/themes/app_colors.dart';
// import '../../../../shared/themes/app_text_styles.dart';
// import '../../../../shared/widgets/long_description_widget.dart';

// class BossOrMinionSection extends StatelessWidget {
//   const BossOrMinionSection({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CharController>(builder: (context, state, child) {
//       return Column(
//         children: [
//           SizedBox(height: deviceHeight! * 0.01),
//           GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: state.bossOrMinion.boosAndMinion.length,
//               itemBuilder: (context, index) {
//                 var option = state.bossOrMinion.boosAndMinion[index];
//                 return Column(
//                   children: [
//                     InkWell(
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: deviceHeight! * 0.2,
//                               child: SvgPicture.asset(
//                                 option.svg,
//                                 color: option.isSelected
//                                     ? AppColors.primary
//                                     : null,
//                               ),
//                             ),
//                             const SizedBox(height: 2),
//                             Text(option.name,
//                                 style: option.isSelected
//                                     ? AppTextStyle.classSelected
//                                         .copyWith(fontSize: 15)
//                                     : AppTextStyle.classNotSelected)
//                           ],
//                         ),
//                         onTap: () {
//                           state.switchBossMinion(option);
//                         }),
//                   ],
//                 );
//               }),
//           SizedBox(height: deviceHeight! * 0.05),
//           LongDescriptionWidget(
//             label: state.bossOrMinionChoice.name,
//             description: state.bossOrMinionChoice.description,
//           )
//         ],
//       );
//     });
//   }
// }
