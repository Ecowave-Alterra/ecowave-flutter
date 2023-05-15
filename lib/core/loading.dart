import 'package:flutter/material.dart';

class EcoLoading extends StatefulWidget {
  const EcoLoading({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EcoLoadingState createState() => _EcoLoadingState();
}

class _EcoLoadingState extends State<EcoLoading>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  late final Animation<double> _animation = Tween<double>(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      width: 120.0,
      height: 120.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RotationTransition(
            turns: _animation,
            child: const SizedBox(
              width: 60.0,
              height: 60.0,
              child: CircularProgressIndicator(
                color: Colors.greenAccent,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Opacity(
                opacity: _animation.value,
                child: child,
              );
            },
            child: const Text(
              'Loading...',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}