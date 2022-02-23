import 'package:flutter/material.dart';

Future<dynamic> callUndoButton(
    BuildContext context, int index, VoidCallback onTap) {
  return showModalBottomSheet(
      isDismissible: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Center(
          child: InkWell(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.35,
                ),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                    color: Colors.grey[500]),
                height: MediaQuery.of(context).size.height * 0.1,
                child: const Center(child: Text('Undo')),
              ),
              onTap: onTap),
        );
      });
}
