import 'package:flutter/material.dart';
import '../../constants/strings.dart';
import '../../data/models/tile_model.dart';
import 'custom_tile.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late double deviceWidth;

  late double deviceHeigth;

  bool isDrawerOpen = true;

  List<Tile> tiles = [
    Tile(title: "Bookmarks", icon: Icons.bookmark_add),
    Tile(title: "Settings", icon: Icons.settings),
  ];

  String selectedTitle = "";
  void navigateTo(String title) {
    switch (title) {
      case "Bookmarks":
        Navigator.pushNamed(context, bookmarksScreen);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeigth = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 12,
          ),
          width: deviceWidth - 150,
          color: Colors.white,
          child: Column(
            children: [
              CustomTile(
                leadingIcon: Icons.account_box_rounded,
                onTap: () {},
                title: "Hisham",
                titleColor: Colors.green,
                leadingIconColor: Colors.green,
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.white,
              ),
              ...List.generate(
                tiles.length,
                (index) => CustomTile(
                  leadingIconColor: selectedTitle == tiles[index].title
                      ? Colors.black
                      : Colors.grey,
                  leadingIcon: tiles[index].icon,
                  onTap: () {
                    setState(() {
                      selectedTitle = tiles[index].title;
                    });
                    navigateTo(tiles[index].title);
                  },
                  title: tiles[index].title,
                  titleColor: selectedTitle == tiles[index].title
                      ? Colors.black
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              size: 40,
            ),
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
