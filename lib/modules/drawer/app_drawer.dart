import 'package:fantasy_name_generator/shared/routes/app_roues.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.75,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.1),
              SizedBox(
                height: size.height * 0.045,
                child: const FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text('Nome da conta'),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              ListTile(
                leading: const Icon(
                  Icons.save_outlined,
                  size: 40,
                  color: Colors.grey,
                ),
                title: const Text("Saved Names"),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.savedNames);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
