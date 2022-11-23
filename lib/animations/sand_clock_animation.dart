import "package:flutter/material.dart";
import 'dart:math' as math;

class SandClockAnimation extends StatefulWidget {
  const SandClockAnimation({Key? key}) : super(key: key);

  @override
  State<SandClockAnimation> createState() =>
      _SandClockAnimationState();
}

class _SandClockAnimationState extends State<SandClockAnimation>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animController;
  bool isEmpty = false;
  @override
  void initState() {
    super.initState();

    animController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<double>(
      begin: 0,
      end: math.pi,
    ).chain(CurveTween(curve: Curves.ease)).animate(animController)
      ..addListener(() {
        // Empty setState because the updated value is already in the animation field
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animController.reverse();
          isEmpty = !isEmpty;
        } else if (status == AnimationStatus.dismissed) {
          animController.forward();
          isEmpty = !isEmpty;
        }
      });
    animController.forward();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Transform.rotate(
          angle: animation.value,
          child: Center(
            child: isEmpty
                ? const Icon(Icons.hourglass_top_rounded)
                : const Icon(
                    Icons.hourglass_bottom_rounded,
                  ),
          ),
        ),
      ),
    );
  }
}
