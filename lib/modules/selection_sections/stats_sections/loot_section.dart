import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stats_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/widgets/atribute_division.dart';

import '../../../../shared/themes/app_text_styles.dart';
import '../../../shared/utils/utils.dart';

class LootSection extends StatelessWidget {
  const LootSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(builder: (context, state, child) {
      return ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const AtributeDivision(label: "Gear"),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.charLoot.items!.length,
              itemBuilder: (context, index) {
                var item = state.charLoot.items![index];
                return LootTile(
                    name: item.name, fullPrice: formatGoldPiece(item.price));
              }),
          SizedBox(height: deviceHeight! * 0.01),
          const AtributeDivision(label: "Jwels"),
          state.charLoot.jwels!.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.charLoot.jwels!.length,
                  itemBuilder: (context, index) {
                    var jwel = state.charLoot.jwels![index];
                    return LootTile(
                        name: jwel.name,
                        fullPrice: formatGoldPiece(jwel.finalPrice),
                        price: jwel.price,
                        qnt: jwel.qnt);
                  })
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "${state.char.charName.fullName} has no jwels",
                    style: AppTextStyle.statsLabel,
                  ),
                ),
          const AtributeDivision(label: "Coin"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 4),
                Text(formatGoldPiece(state.charLoot.gold!),
                    style: AppTextStyle.statsLabel
                        .copyWith(color: Colors.grey[300])),
              ],
            ),
          ),
          SizedBox(height: deviceHeight! * 0.01),
        ],
      );
    });
  }
}

class LootTile extends StatelessWidget {
  final String name;
  final dynamic fullPrice;
  final int? qnt;
  final int? price;
  const LootTile({
    Key? key,
    required this.name,
    required this.fullPrice,
    this.qnt,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  style: AppTextStyle.statsLabel
                      .copyWith(color: Colors.grey[300])),
              Text(fullPrice,
                  style: AppTextStyle.statsLabel
                      .copyWith(color: Colors.grey[300])),
            ],
          ),
          const SizedBox(height: 3),
          if (price != null && qnt != null)
            Row(
              children: [
                SizedBox(
                    width: deviceWidth! * 0.16,
                    child: Row(
                      children: [
                        Text("Qnt:", style: AppTextStyle.traitDescription),
                        const SizedBox(width: 4),
                        Text(qnt.toString(),
                            style: AppTextStyle.statsLabel
                                .copyWith(color: Colors.grey[300])),
                      ],
                    )),
                SizedBox(
                    child: Row(
                  children: [
                    Text("Unity price:", style: AppTextStyle.traitDescription),
                    const SizedBox(width: 4),
                    Text(formatGoldPiece(price!),
                        style: AppTextStyle.statsLabel
                            .copyWith(color: Colors.grey[300])),
                  ],
                )),
              ],
            ),
          if (price != null && qnt != null) const SizedBox(height: 12),
        ],
      ),
    );
  }
}
