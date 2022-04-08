import 'package:flutter/material.dart';

import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/atribute_division.dart';

class LootSection extends StatelessWidget {
  const LootSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AtributeDivision(label: "Gear"),
        LootTile(
          name: "Weapon Name",
          price: 0,
        ),
        SizedBox(height: 4),
        LootTile(
          name: "Weapon Name",
          price: 0,
        ),
        SizedBox(height: 4),
        LootTile(
          name: "Armor Name",
          price: 0,
        ),
        SizedBox(height: 4),
        LootTile(
          name: "Shield Name",
          price: 0,
        ),
        SizedBox(height: 4),
        AtributeDivision(label: "Treasures"),
      ],
    );
  }
}

class LootTile extends StatelessWidget {
  final String name;
  final String? magic;
  final String? effect;
  final int price;
  const LootTile({
    Key? key,
    required this.name,
    this.magic,
    this.effect,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        children: [
          Text(name,
              style:
                  AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300])),
          const SizedBox(width: 4),
          Text(magic ?? "",
              style:
                  AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300])),
          const SizedBox(width: 4),
          Text(effect ?? "",
              style:
                  AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300])),
          const SizedBox(width: 10),
          Text("Price:", style: AppTextStyle.subTextGrey),
          const SizedBox(width: 4),
          Text(price.toString(),
              style:
                  AppTextStyle.subTextWhite.copyWith(color: Colors.grey[300])),
        ],
      ),
    );
  }
}
