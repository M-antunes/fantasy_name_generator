import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CardToFlip extends StatelessWidget {
  final GlobalKey<FlipCardState> cardKey;
  final Size size;
  final String text;
  bool? isSet;

  CardToFlip({
    Key? key,
    required this.cardKey,
    required this.size,
    required this.text,
    this.isSet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 20,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isSet! ? Colors.black : Colors.white,
            ),
            width: size.width * 0.18,
            height: size.height * 0.06,
            child: Center(
              child: Text(
                text,
                style: isSet!
                    ? AppTextStyle.flipCardMale
                    : AppTextStyle.flipCardFemale,
              ),
            ),
          ),
        ),
        onTap: () {
          isSet = !isSet!;
          cardKey.currentState!.toggleCard();
        });
  }
}
