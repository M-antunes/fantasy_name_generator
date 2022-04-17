import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/controller/saved_char_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/routes/app_roues.dart';
import 'package:flutter/material.dart';

class CreateOrCheckSavedPage extends StatelessWidget {
  const CreateOrCheckSavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    var savedNameCtrl = SavedCharController();

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: deviceWidth! * 0.6,
          child: const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('Fantasy Character Generator'),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Card(
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            width: deviceWidth! * 0.7,
            height: deviceHeight! * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text("Create New Char"),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.charSection);
                    savedNameCtrl.loadStoredCharacters();
                  },
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text("View Characters"),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.savedCharSelection);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
