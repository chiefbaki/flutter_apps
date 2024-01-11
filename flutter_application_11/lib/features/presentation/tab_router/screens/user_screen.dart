import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/providers/changetheme_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ChangeThemeProvider>(context);
    return Scaffold(
      backgroundColor: theme.changeTheme(),
      body: Center(
        child: Text("user"),
      ),
    );
  }
}