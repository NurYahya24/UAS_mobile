import 'package:flutter/material.dart';
import 'package:posttest6/screens/change_password.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'signin_screen.dart';
import 'about_page.dart';
import '../theme_mode_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();
  Future<void> showDeleteConfirmationDialog(BuildContext context) async {
    Future<void> deleteAccount() async {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await user.delete();
          print("User account deleted.");
        } else {
          print("No user signed in.");
        }
      } catch (e) {
        print("Error deleting account: $e");
      }
    }

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Account"),
          content: Text(
              "Are you sure you want to delete your account? This action cannot be undone."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await deleteAccount();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignInScreen(),
                  ),
                );
              },
              child: Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SimpleUserCard(
              imageRadius: 20,
              userName: "Kelompok UAS",
              userProfilePic: const AssetImage('assets/images/kursi.jpg'),
              icon: Icon(Icons.camera_alt_rounded),
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    Provider.of<ThemeModeData>(context, listen: false)
                        .changeTheme(
                            Provider.of<ThemeModeData>(context, listen: false)
                                    .isDarkModeActive
                                ? ThemeMode.light
                                : ThemeMode.dark);
                  },
                  icons: Theme.of(context).brightness == Brightness.dark
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'Dark mode',
                  subtitle: Theme.of(context).brightness == Brightness.light
                      ? "Disabled"
                      : "Enabled",
                  trailing: Switch.adaptive(
                    value: Provider.of<ThemeModeData>(context, listen: false)
                        .isDarkModeActive,
                    onChanged: (bool value) {
                      Provider.of<ThemeModeData>(context, listen: false)
                          .changeTheme(
                              value ? ThemeMode.dark : ThemeMode.light);
                    },
                  ),
                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutPage()));
                  },
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About',
                  subtitle: "Learn more about IKOA FURNITURE",
                ),
              ],
            ),
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed Out");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    });
                  },
                  icons: Icons.exit_to_app_rounded,
                  title: "Sign Out",
                ),
                SettingsItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => changePassword()));
                  },
                  icons: CupertinoIcons.repeat,
                  title: "Change Password",
                ),
                SettingsItem(
                  onTap: () async {
                    showDeleteConfirmationDialog(context);
                  },
                  icons: CupertinoIcons.delete_solid,
                  title: "Delete account",
                  titleStyle: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
