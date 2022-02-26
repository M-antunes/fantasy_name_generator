import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';

import 'widgets/advance_button.dart';

class AlignmentSelection extends StatelessWidget {
  final VoidCallback onTap;
  const AlignmentSelection({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.maxFinite,
      child: Consumer<CharController>(builder: (context, state, child) {
        return Column(
          children: [
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: size.width * 0.4,
                    childAspectRatio: 5 / 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1),
                itemCount: state.listOfAlignments.allAlignments.length,
                itemBuilder: (context, index) {
                  var alignment = state.listOfAlignments.allAlignments[index];
                  return InkWell(
                      child: Card(
                        color: alignment.isSelected
                            ? Colors.red[900]
                            : Colors.grey[700],
                        elevation: 12,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              alignment.name,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        state.switchAlignment(alignment);
                      });
                }),
            AdvanceButton(size: size, onTap: onTap)
          ],
        );
      }),
    );
  }
}
