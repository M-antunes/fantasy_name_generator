import 'package:fantasy_name_generator/controllers/names_controller.dart';
import 'package:fantasy_name_generator/modules/drawer/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class SavedNamesPage extends StatelessWidget {
  const SavedNamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<NamesController>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: SizedBox(
          width: size.width * 0.4,
          child: const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('Saved Names'),
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.search_rounded, size: 30),
          SizedBox(width: 15),
        ],
      ),
      body: controller.savedNames.isEmpty
          ? const Center(
              child: Text(
                "No Saved\nNames",
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: controller.savedNames.length,
              itemBuilder: (context, index) {
                var name = controller.savedNames[index];
                return Card(
                  elevation: 12,
                  margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: 10,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(
                        name.gender == 0
                            ? Icons.female_rounded
                            : Icons.male_rounded,
                        size: 30,
                        color: Colors.grey[600],
                      ),
                    ),
                    title: Text("${name.firstName} ${name.lastName}"),
                  ),
                );
              }),
    );
  }
}
