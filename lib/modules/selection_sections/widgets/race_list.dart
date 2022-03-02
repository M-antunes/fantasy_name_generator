import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

import 'package:fantasy_name_generator/modules/selection_sections/widgets/advance_button.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class RaceList extends StatelessWidget {
  const RaceList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.45,
      child: Consumer<CharController>(builder: (context, state, child) {
        return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
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
                      child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: Text(
                          race.name,
                          style: AppTextStyle.selectRace,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    state.switchRace(race);
                  });
            });
      }),
    );
  }
}
