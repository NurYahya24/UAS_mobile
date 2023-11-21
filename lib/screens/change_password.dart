import 'package:firebase_auth/firebase_auth.dart';
import 'package:posttest6/widgets/reusable_widget.dart';
import 'package:posttest6/utils/color_utils.dart';
import 'package:flutter/material.dart';

class changePassword extends StatefulWidget {
  const changePassword({Key? key}) : super(key: key);
  @override
  _changePasswordState createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  TextEditingController _oldpasswordTextController = TextEditingController();
  TextEditingController _newpasswordTextController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  Future<void> _changePassword() async {
    try {
      setState(() {
        _isLoading = true;
      });

      var currentUser = _auth.currentUser;
      if (currentUser != null) {
        var cred = EmailAuthProvider.credential(
            email: currentUser.email!,
            password: _oldpasswordTextController.text);
        await currentUser.reauthenticateWithCredential(cred);
        await currentUser.updatePassword(_newpasswordTextController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password changed successfully'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User Not Found'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      print("Password change failed: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password change failed. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _oldpasswordTextController.dispose();
    _newpasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Change Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("1525d4"),
            hexStringToColor("2757a1"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Old Password", Icons.lock_outline, true,
                    _oldpasswordTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("New Password", Icons.lock_outline, true,
                    _newpasswordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Change Password", () async {
                  await _changePassword();
                }),
                _isLoading
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      )
                    : Container(),
              ],
            ),
          ))),
    );
  }
}
