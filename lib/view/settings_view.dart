import 'package:e_commerce/theme/theme_services.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: MaterialButton(
            onPressed: () {
              ThemeServices().changeThemeMode();
            },
            child: Text("Dark Mood"),
          ),
        ),
      ),
    );
  }
}
