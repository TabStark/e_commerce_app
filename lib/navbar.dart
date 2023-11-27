import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Tabrez Ahmed"),
            accountEmail: Text("tabstark7@apple.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://imagevars.gulfnews.com/2023/04/01/Bollywood-actor-Shah-Rukh-Khan_1873bc75dda_medium.jpg",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration:
                BoxDecoration(color: Theme.of(context).primaryColorLight),
          ),
          const ListTile(
            title: Text(
              "Account Settings",
              style: TextStyle(fontSize: 23),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Edit Personal"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favorite"),
            onTap: () => null,
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.cartShopping),
            title: Text("Cart"),
            onTap: () => null,
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.wallet,
              size: 20,
            ),
            title: const Text("Saved cards & Wallet"),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.login_outlined),
            title: const Text("Login & Security"),
            onTap: () => null,
          ),
          const SizedBox(
            height: 40,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          const ListTile(
            title: Text(
              "Feedback & Information",
              style: TextStyle(fontSize: 23),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.file_copy),
            title: const Text("Login & Security"),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.question_mark),
            title: const Text("FAQs"),
            onTap: () => null,
          ),
          Container(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.logout,
                color: Colors.red,
              ),
              style: OutlinedButton.styleFrom(
                  primary: Colors.red,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  side: const BorderSide(color: Colors.red)),
            ),
          )
        ],
      ),
    );
  }
}
