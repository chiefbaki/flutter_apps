import 'package:flutter/material.dart';
import 'package:flutter_application_8/resources/resources.dart';
import 'package:flutter_application_8/ui/presentation/theme/app_colors.dart';
import 'package:flutter_application_8/ui/presentation/widgets/container_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: AppColors.bgColor,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Stack(
              fit: StackFit.expand,
                    children: [
            Positioned(left: 0, top: 100, child: circleFirst()),
            Positioned(right: 0, top: 570, child: circleSecond(),),
            const Positioned(
              top: 191,
              bottom: 191,
                child: Stack(
              children: [ContainerForm()],
            ))
                    ],
                  )),
      ),
    );
  }
}

Widget circleFirst() {
  return Image.asset(
    AppImgs.circle1,
    width: 215,
    height: 215,
  );
}

Widget circleSecond() {
  return Image.asset(
    AppImgs.circle2,
    width: 287,
    height: 287,
  );
}
