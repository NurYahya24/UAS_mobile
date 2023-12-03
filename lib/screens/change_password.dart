import 'package:firebase_auth/firebase_auth.dart';
import 'package:posttest6/widgets/reusable_widget.dart';
import 'package:posttest6/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

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
  String _oldPasswordError = '';
  String _newPasswordError = '';
  @override
  void initState() {
    super.initState();
    _oldpasswordTextController.addListener(() {
      setState(() {
        _oldPasswordError = '';
      });
    });

    _newpasswordTextController.addListener(() {
      setState(() {
        _newPasswordError = '';
      });
    });
  }

  Future<void> _changePassword() async {
    try {
      var currentUser = _auth.currentUser;
      if (currentUser != null) {
        var cred = EmailAuthProvider.credential(
            email: currentUser.email!,
            password: _oldpasswordTextController.text);
        await currentUser.reauthenticateWithCredential(cred);
        await currentUser.updatePassword(_newpasswordTextController.text);
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Change Password Was Successful',
            message: 'You can now sign in to the app with new password',
            contentType: ContentType.success,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      } else {
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'User not found',
            message: '',
            contentType: ContentType.failure,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    } catch (error) {
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Change Password Was Failed',
          message: ' ',
          contentType: ContentType.success,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
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
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Change Password",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
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
                    _oldpasswordTextController,
                    errorText: _oldPasswordError),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("New Password", Icons.lock_outline, true,
                    _newpasswordTextController,
                    errorText: _newPasswordError),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Change Password", () async {
                  if (_oldpasswordTextController.text.isEmpty) {
                    setState(() {
                      _oldPasswordError = 'Old Password is required';
                      _newPasswordError = '';
                    });
                    return;
                  }

                  if (_newpasswordTextController.text.isEmpty) {
                    setState(() {
                      _newPasswordError = 'New Password is required';
                      _oldPasswordError = '';
                    });
                    return;
                  }
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
