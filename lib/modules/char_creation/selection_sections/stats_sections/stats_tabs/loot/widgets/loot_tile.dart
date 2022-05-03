import 'package:flutter/material.dart';

import '../../../../../../../shared/constants/phone_sizes.dart';
import '../../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../../shared/utils/utils.dart';

class LootTile extends StatelessWidget {
  final String name;
  final dynamic fullPrice;
  final int? qnt;
  final int? price;
  final bool onCharSheet;
  const LootTile({
    Key? key,
    required this.name,
    required this.fullPrice,
    this.qnt,
    this.price,
    this.onCharSheet = false,
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
                  style:
                      AppTextStyle.statsLabel.copyWith(color: Colors.grey[300]),
                  textScaleFactor: onCharSheet ? 0.9 : 1),
              Text(fullPrice,
                  style:
                      AppTextStyle.statsLabel.copyWith(color: Colors.grey[300]),
                  textScaleFactor: onCharSheet ? 0.9 : 1),
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
                        Text("Qnt:",
                            style: AppTextStyle.traitDescription,
                            textScaleFactor: onCharSheet ? 0.9 : 1),
                        const SizedBox(width: 4),
                        Text(qnt.toString(),
                            style: AppTextStyle.statsLabel
                                .copyWith(color: Colors.grey[300]),
                            textScaleFactor: onCharSheet ? 0.9 : 1),
                      ],
                    )),
                SizedBox(
                    child: Row(
                  children: [
                    Text("Unity price:",
                        style: AppTextStyle.traitDescription,
                        textScaleFactor: onCharSheet ? 0.9 : 1),
                    const SizedBox(width: 4),
                    Text(formatGoldPiece(price!),
                        style: AppTextStyle.statsLabel
                            .copyWith(color: Colors.grey[300]),
                        textScaleFactor: onCharSheet ? 0.9 : 1),
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
