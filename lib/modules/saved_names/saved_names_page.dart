import 'package:fantasy_name_generator/controllers/names_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class SavedNamesPage extends StatelessWidget {
  const SavedNamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<NamesController>();
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
        actions: const [
          Icon(Icons.search_rounded, size: 30),
          SizedBox(width: 15),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
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
                return Dismissible(
                  key: ValueKey(controller.savedNames.elementAt(index)),
                  background: Container(
                    color: Colors.red[900],
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.delete,
                          size: 40,
                          color: Colors.red[200],
                        ),
                      ),
                    ),
                  ),
                  onDismissed: (direction) => controller.deleteName(name),
                  child: Card(
                    elevation: 12,
                    margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(name.picture),
                        ),
                        title: Text("${name.firstName} ${name.lastName}"),
                        subtitle: Row(
                          children: [
                            Text(name.race),
                            Text(name.gender == 0 ? " Female" : " Male"),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
