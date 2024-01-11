import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/providers/changetheme_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ChangeThemeProvider>(context);
    return Scaffold(
      backgroundColor: theme.changeTheme(),
      body: Center(
        child: Text("favourite"),
      ),
    );
  }
}
class HomeScreen {
  const HomeScreen();
}
