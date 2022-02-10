import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
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
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text('Nome da conta'),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              ListTile(
                leading: Icon(
                  Icons.change_circle_sharp,
                  size: 40,
                  color: Colors.grey,
                ),
                title: Text("Select Another Race"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.save_outlined,
                  size: 40,
                  color: Colors.grey,
                ),
                title: Text("Saved Names"),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: SizedBox(
          width: size.width * 0.6,
          child: const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('Fantasy Name Generator'),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: size.width * 0.3,
              child: const FittedBox(
                fit: BoxFit.fitWidth,
                child: Text('Race Name'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.15,
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: size.width * 0.7,
                  height: size.height * 0.35,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/images/human.jpg')),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: SizedBox(
                        height: size.height * 0.04,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            'big name',
                            style: AppTextStyle.generatedName,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    )
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.02,
              ),
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.5,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: SizedBox(
                    width: size.width * 0.2,
                    child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('Generate'),
                    ),
                  ),
                ),
              ),
            ),
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            radius: 0,
            highlightColor: Colors.transparent,
            onTap: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                child: Text('Change gender'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Save this name'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
