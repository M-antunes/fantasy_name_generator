import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';

class NameSelection extends StatelessWidget {
  final VoidCallback onGenerate;
  final VoidCallback onSelect;
  const NameSelection({
    Key? key,
    required this.onGenerate,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Column(
        children: [
          Consumer<CharController>(builder: (context, state, child) {
            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onDoubleTap: () => state.switchNameAndLastName(),
              child: Card(
                elevation: 6,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: size.height * 0.1,
                  width:
                      deviceWidth! < 400 ? size.width * 0.96 : size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                  ),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        state.lastNameShown
                            ? "${state.newName} ${state.newLastName}"
                            : state.newName,
                        style: AppTextStyle.generatedName,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () => callMessageSnackbar(
                  context,
                  "Double tap to switch name and last name",
                  Colors.grey[700],
                  null),
            );
          }),
          SizedBox(
            height: size.height * 0.01,
          ),
          // AppGenerateButton(onGenerate: onGenerate)
        ],
      ),
    );
  }
}

//  state.isEditingNameReady
//                           ? TextFormField(
//                               cursorColor: Colors.grey,
//                               cursorHeight: 28,
//                               textAlign: TextAlign.center,
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                               ),
//                               initialValue:
//                                   "${state.newName} ${state.newLastName}",
//                               style: AppTextStyle.generatedName,
//                             )
//                           : 
