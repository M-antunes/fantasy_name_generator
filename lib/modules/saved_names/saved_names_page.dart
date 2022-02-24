import 'package:fantasy_name_generator/controllers/names_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class SavedNamesPage extends StatefulWidget {
  const SavedNamesPage({Key? key}) : super(key: key);

  @override
  State<SavedNamesPage> createState() => _SavedNamesPageState();
}

class _SavedNamesPageState extends State<SavedNamesPage> {
  late NamesController controller;

  @override
  void initState() {
    controller = context.read<NamesController>();
    super.initState();
  }

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
          : Consumer<NamesController>(builder: (context, state, child) {
              return ListView.builder(
                  itemCount: state.savedNames.length,
                  itemBuilder: (context, index) {
                    var character = state.savedNames[index];
                    return Dismissible(
                      key: ValueKey(state.savedNames.elementAt(index)),
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
                      onDismissed: (direction) => state.deleteName(
                        character,
                        index,
                        context,
                      ),
                      child: Card(
                        elevation: 12,
                        margin: EdgeInsets.only(
                          right: size.width * 0.04,
                          left: size.width * 0.04,
                          top: 6,
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(character.gender == 0
                                ? character.race.femalePicture
                                : character.race.malePicture),
                          ),
                          title: Text(character.fullName),
                          subtitle: Row(
                            children: [
                              Text(character.race.name),
                              Text(character.gender == 0 ? " Female" : " Male"),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }),
    );
  }
}
