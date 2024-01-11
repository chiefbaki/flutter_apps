import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/providers/changetheme_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ChangeThemeProvider>(context);
    return Scaffold(
      backgroundColor: theme.changeTheme(),
      body: Center(
        child: Text("location"),
      ),
    );
  }
}