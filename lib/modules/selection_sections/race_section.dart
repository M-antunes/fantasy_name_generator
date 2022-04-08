import 'package:flutter/material.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RaceList(),
              SizedBox(height: size.height * 0.03),
              const RaceTraits(),
            ],
          ),
        ),
      ],
    );
  }
}
