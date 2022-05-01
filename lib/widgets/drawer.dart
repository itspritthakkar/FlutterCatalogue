
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: const [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountEmail: Text("prit@thakkar.tk"),
                  accountName: Text("Prit Thakkar"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage("https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-Picture.png"),
                  ),
                )
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home, color: Colors.white
              ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white
                  )
                )
            ),
            ListTile(
                leading: Icon(
                    CupertinoIcons.profile_circled, color: Colors.white
                ),
                title: Text(
                    "Profile",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                        color: Colors.white
                    )
                )
            ),
            ListTile(
                leading: Icon(
                    CupertinoIcons.mail, color: Colors.white
                ),
                title: Text(
                    "Contact Us",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                        color: Colors.white
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}
