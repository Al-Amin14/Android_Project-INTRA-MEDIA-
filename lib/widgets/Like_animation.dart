<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:29c138e0eb383743d69bf04e6e75dbad5bfd87479349a50ee90877401bdca184
size 1630
=======
import 'package:flutter/material.dart';

class LikeAnimation extends StatefulWidget {
  final Widget child;
  final bool isanimating;
  final Duration duration;
  final VoidCallback? onEnd;
  final bool smallLike;
  const LikeAnimation({
    super.key,
    required this.child,
    required this.isanimating,
    this.duration = const Duration(milliseconds: 150),
    this.onEnd,
    this.smallLike = false,
  });

  @override
  State<LikeAnimation> createState() => _LikeAnimationState();
}

class _LikeAnimationState extends State<LikeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;

  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: widget.duration.inMilliseconds ~/ 2,
        ));
    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
  }

  @override
  void didUpdateWidget(covariant LikeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isanimating != oldWidget.isanimating) {
      startAnimation();
    }
  }

  startAnimation() async {
    await controller.forward();
    await controller.reverse();
    await Future.delayed(const Duration(milliseconds: 200));

    if (widget.onEnd != null) {
      widget.onEnd!();
    }
  }

  void dispose() {
    super.dispose();
    controller.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
    scale: scale,
    child: widget.child,);
  }
}
>>>>>>> master
