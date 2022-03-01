import 'package:flutter/material.dart';

class AtributeDivision extends StatelessWidget {
  final Size size;
  final String label;
  final String? label2;
  const AtributeDivision({
    Key? key,
    required this.size,
    required this.label,
    this.label2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.005),
        Container(
          width: size.width * 0.92,
          height: size.height * 0.002,
          color: Colors.grey,
        ),
        Padding(padding: const EdgeInsets.only(top: 3), child: Text(label)),
        Container(
          width: size.width * 0.92,
          height: size.height * 0.002,
          color: Colors.grey,
        ),
        if (label2 != null)
          Text(
            label2!,
            style: TextStyle(color: Colors.grey[600]),
          ),
        SizedBox(height: size.height * 0.01),
      ],
    );
  }
}
