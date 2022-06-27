import 'package:flutter/material.dart';

import '../main.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              headerItem(context),
              menuItems(context),
            ],
          ),
        ),
      );

  Widget headerItem(BuildContext context) => Container(
      height: MediaQuery.of(context).size.height * 0.29,
      color: Colors.blue.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_outline_outlined,
            size: MediaQuery.of(context).size.height * 0.09,
            color: Colors.white,
          ),
          Text(
            'tebogo mashika'.toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ));

  Widget menuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_applications_outlined),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('Log out'),
              onTap: () {},
            ),
          ],
        ),
      );
}
