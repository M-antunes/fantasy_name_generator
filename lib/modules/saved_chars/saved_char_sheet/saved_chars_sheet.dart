import 'package:flutter/material.dart';

class SavedCharSheet extends StatelessWidget {
  const SavedCharSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  CircleAvatar(),
                  CircleAvatar(),
                  CircleAvatar(),
                  CircleAvatar(),
                  CircleAvatar(),
                  CircleAvatar(),
                  CircleAvatar(),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
