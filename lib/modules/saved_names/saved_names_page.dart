import 'package:flutter/material.dart';

class SavedNamesPage extends StatelessWidget {
  const SavedNamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: size.width * 0.4,
          child: const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('Saved Names'),
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
