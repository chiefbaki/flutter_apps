import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/features/presentation/theme/app_fonts.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: 335,
      child: ExpandableText(
        widget.text,
        style: AppFonts.s12w500.copyWith(color: Colors.white),
        expandText: 'More',
        collapseText: 'Less',
        maxLines: 6,
        linkColor: Colors.orange,
      ),
    );
  }
}
