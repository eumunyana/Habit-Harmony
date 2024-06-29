// lib/animations/open_container_transition.dart

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class OpenContainerTransition extends StatelessWidget {
  final Widget closedChild;
  final Widget openChild;

  const OpenContainerTransition({super.key, required this.closedChild, required this.openChild});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (context, openContainer) {
        return GestureDetector(
          onTap: openContainer,
          child: closedChild,
        );
      },
      openBuilder: (context, closeContainer) {
        return openChild;
      },
    );
  }
}
