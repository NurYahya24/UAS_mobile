import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:posttest6/screens/change_password.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'signin_screen.dart';
import 'about_page.dart';
import '../theme_mode_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage();

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _pickedImageBytes;

  Future<void> _uploadProfileImage(Uint8List imageBytes) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      String imageName = 'profile_images/$userId.jpg';
      Reference storageReference =
          FirebaseStorage.instance.ref().child(imageName);
      UploadTask uploadTask = storageReference.putData(imageBytes);
      await uploadTask.whenComplete(() => null);
      String imageUrl = await storageReference.getDownloadURL();

      await FirebaseAuth.instance.currentUser
          ?.updateProfile(photoURL: imageUrl);

      print('Gambar berhasil diupload dan dihubungkan dengan akun pengguna.');
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      final Uint8List uint8List = Uint8List.fromList(imageBytes);

      setState(() {
        _pickedImageBytes = uint8List;
      });
      await _uploadProfileImage(uint8List);
    }
  }

  Future<void> showLogOutConfirmationDialog(BuildContext context) async {
    Future<void> LogoutAccount() async {
      try {
        await FirebaseAuth.instance.signOut();
        print("User Logout Success.");
      } catch (e) {
        print("Error Log Out account: $e");
      }
    }

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Log Out Account"),
          content: Text(
              "Are you sure you want to log out from your account? This action cannot be undone."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await LogoutAccount();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => SignInScreen(),
                  ),
                );
              },
              child: Text(
                "Log Out",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

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
                Navigator.of(context).pushReplacement(
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
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: _pickedImageBytes != null
                          ? Image.memory(_pickedImageBytes!,
                              fit: BoxFit.cover, width: 140, height: 140)
                          : Image.network('assets/images/kursi.jpg',
                              fit: BoxFit.cover, width: 140, height: 140),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: IconButton(
                      onPressed: _pickImage,
                      icon: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                      ),
                      tooltip: 'Edit Profile Picture',
                    ),
                  ),
                ],
              ),
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
                  onTap: () async {
                    await showLogOutConfirmationDialog(context);
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
