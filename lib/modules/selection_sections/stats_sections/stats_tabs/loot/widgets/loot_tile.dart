import 'package:flutter/material.dart';

import '../../../../../../shared/constants/phone_sizes.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/utils/utils.dart';

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
