import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_admin_controller/char_adimin_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/routes/app_roues.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class CreateOrCheckSavedPage extends StatelessWidget {
  const CreateOrCheckSavedPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    final admin = context.read<CharAdminController>();

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: deviceWidth! * 0.6,
          child: const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('Fantasy Character Generator'),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainMenuIcon(
                    label: "Create\nMinion",
                    svg: "assets/images/minions.svg",
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.minionSection)),
                MainMenuIcon(
                    label: "Create\nBoss",
                    svg: "assets/images/boss.svg",
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.charSection)),
              ],
            ),
            SizedBox(height: deviceHeight! * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainMenuIcon(
                    label: "Manage\nEncounters",
                    svg: "assets/images/encounter.svg",
                    onPressed: () {}),
                MainMenuIcon(
                    label: "Saved\nCharacters",
                    svg: "assets/images/char_shelf.svg",
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRoutes.savedCharSelection);
                      admin.loadCharFromHive();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MainMenuIcon extends StatelessWidget {
  final String svg;
  final String label;
  final VoidCallback onPressed;
  const MainMenuIcon({
    Key? key,
    required this.svg,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      height: deviceHeight! * 0.2,
      width: deviceWidth! * 0.35,
      color: Colors.grey[900]!,
      child: Column(
        children: [
          SvgPicture.asset(svg, height: deviceWidth! < 300 ? 70 : 90),
          SizedBox(height: deviceHeight! * 0.003),
          Text(label,
              style: AppTextStyle.subTextWhite, textAlign: TextAlign.center),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
