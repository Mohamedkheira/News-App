import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/ui/home/widget/drawer_item.dart';

typedef OnTabClick = void Function(MenuTab);
class CustomDrawer extends StatelessWidget {

  OnTabClick onTab;
  CustomDrawer({super.key, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 43),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            alignment: Alignment.center,
            child: Text(
                'News App!', style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          DrawerItem(
            onPress: (){
              onTab(MenuTab.Catogery);
            },
            image: 'assets/images/catecory.svg',
            title: 'Categories',
          ),
          DrawerItem(
            onPress: (){
              onTab(MenuTab.Settings);
            },
            image: 'assets/images/settings.svg',
            title: 'Settings',
          ),
        ],
      ),
    );
  }
}

enum MenuTab{
  Catogery,
  Settings,
}
