import 'package:flutter/material.dart';
import 'package:untitled1/pages/LogIn.dart';

// ignore: must_be_immutable
class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('User'),
              accountEmail: Text(email_value),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    '././assets/images/avatar.png',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                  color: Colors.limeAccent,
                  image: DecorationImage(
                    image: AssetImage(
                      '././assets/images/sunset_back_ava.jpg',
                    ),
                    fit: BoxFit.cover,
                  )),
            ),


            ListTile(
              leading: const Icon(Icons.webhook),
              title: const Text('GameScreen'),
              onTap: () => Navigator.pushNamed(context, '/home'),
            ),
          ],
        ));
  }
}