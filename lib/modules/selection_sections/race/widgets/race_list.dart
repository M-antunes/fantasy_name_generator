import 'package:fantasy_name_generator/controllers/stage_controller/char_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class RaceList extends StatelessWidget {
  const RaceList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      child: Consumer<CharController>(builder: (context, state, child) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.listOfRaces.races.length,
          itemBuilder: (context, index) {
            var race = state.listOfRaces.races[index];
            return InkWell(
                child: Card(
                  color: race.isSelected ? Colors.red[900] : Colors.grey[700],
                  elevation: 12,
                  // margin: EdgeInsets.symmetric(
                  //     horizontal: size.width * 0.1,
                  //     vertical: size.height * 0.005),
                  child: Center(
                    child: Text(
                      race.name,
                      style: AppTextStyle.selectRace,
                    ),
                  ),
                ),
                onTap: () {
                  state.switchRace(race);
                });
          },
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: size.width * 0.3,
              childAspectRatio: 6 / 3,
              crossAxisSpacing: 0.5,
              mainAxisSpacing: 0.5),
        );
      }),
    );
  }
}
