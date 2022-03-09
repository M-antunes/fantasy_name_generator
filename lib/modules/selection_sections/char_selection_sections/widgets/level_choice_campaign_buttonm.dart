import 'package:flutter/material.dart';

class LevelChoiceCampaignButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color boxColor;
  final Color textColor;
  const LevelChoiceCampaignButton({
    Key? key,
    required this.label,
    required this.onTap,
    required this.boxColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(30),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        child: Text(
          label,
          style: TextStyle(color: textColor, fontFamily: "Tinos", fontSize: 18),
        ),
      ),
      onTap: onTap,
    );
  }
}
