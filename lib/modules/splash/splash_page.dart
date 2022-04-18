import 'dart:async';

import 'package:fantasy_name_generator/modules/create_or_check_saved/create_or_check_saved_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/char_admin_controller/char_adimin_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 3000), () {
      var savedNameCtrl = context.read<CharAdminController>();
      savedNameCtrl.loadStoredCharacters();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => CreateOrCheckSavedPage(
                    savedNameCtrl: savedNameCtrl,
                  )));
    });
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Fantasy\nCharacter\nGenerator',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontFamily: "Chomsky"),
            ),
          ),
        ),
      ),
    );
  }
}
