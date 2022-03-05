import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/race_list.dart';
import 'widgets/race_traits.dart';

class RaceSelection extends StatelessWidget {
  const RaceSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              RaceList(),
              RaceTraits(),
            ],
          ),
        ),
        SizedBox(height: size.height * 0.03),
      ],
    );
  }
}
