import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({Key? key}) : super(key: key);

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    chooseMale() {
      setState(() {
        isMaleSelected = true;
        isFemaleSelected = false;
      });
    }

    chooseFemale() {
      setState(() {
        isFemaleSelected = true;
        isMaleSelected = false;
      });
    }

    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: 300,
                  width: isMaleSelected ? size.width * 0.6 : size.width * 0.38,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text("Male",
                          style: TextStyle(
                              fontSize: isMaleSelected ? 60 : 20,
                              color: isMaleSelected
                                  ? Colors.yellow
                                  : Colors.white)),
                    ),
                  ),
                ),
                onTap: () => chooseMale(),
              ),
              Container(
                width: size.width * 0.01,
                height: 300,
                color: Colors.white,
              ),
              InkWell(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: 300,
                  width:
                      isFemaleSelected ? size.width * 0.6 : size.width * 0.38,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Female",
                          style: TextStyle(
                              fontSize: isFemaleSelected ? 60 : 20,
                              color: isFemaleSelected
                                  ? Colors.yellow
                                  : Colors.white)),
                    ),
                  ),
                ),
                onTap: () => chooseFemale(),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.05),
          InkWell(
            child: Container(
              width: double.infinity,
              height: size.height * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[800],
                border: Border.all(color: Colors.red[900]!, width: 2),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.3,
                vertical: 10,
              ),
              child: const Center(
                child: Text(
                  'Select',
                  style: AppTextStyle.selectButtonReady,
                ),
              ),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final Size size;
  final String text;
  final double nweWidth;
  const GenderCard({
    Key? key,
    required this.size,
    required this.text,
    required this.nweWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: double.maxFinite,
      width: nweWidth,
      child: Center(
        child: Text(
          text,
          style: AppTextStyle.changeRace,
        ),
      ),
    );
  }
}
