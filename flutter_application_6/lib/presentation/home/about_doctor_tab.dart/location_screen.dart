import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/resources/resources.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationScreen extends StatelessWidget {
  final String phone;
  final String address;
  final String email;
  const LocationScreen(
      {super.key,
      required this.phone,
      required this.email,
      required this.address});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(AppImg.phone),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  phone,
                  style: AppFonts.s18w400,
                )
              ],
            ),
            const Divider(),
            Row(
              children: [
                SvgPicture.asset(AppImg.locationPlus),
                const SizedBox(
                  width: 12,
                ),
                Text(address, style: AppFonts.s18w400)
              ],
            ),
            const Divider(),
            Row(
              children: [
                SvgPicture.asset(AppImg.envelope),
                const SizedBox(
                  width: 12,
                ),
                Text(email, style: AppFonts.s18w400)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
