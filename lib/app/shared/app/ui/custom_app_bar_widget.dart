import 'package:flutter/material.dart';
import 'package:movies_app/app/shared/design_system/color_palette.dart';
import 'package:movies_app/app/shared/design_system/styles.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;

  const CustomAppBarWidget({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: titleAppBarStyle,
      ),
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: white),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      automaticallyImplyLeading: showBackButton,
      actions: actions,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [deepPurpleShade200, deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
