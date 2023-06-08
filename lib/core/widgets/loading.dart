part of 'package:ecowave/core.dart';

class EcoLoading extends StatefulWidget {
  const EcoLoading({Key? key}) : super(key: key);

  @override
  State<EcoLoading> createState() => _EcoLoadingState();
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSizes.radiusButton),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          width: 6 * AppSizes.secondary,
          height: 6 * AppSizes.secondary,
          child: RotationTransition(
            turns: _animation,
            child: const SizedBox(
              width: 3 * AppSizes.secondary,
              height: 6 * AppSizes.secondary,
              child: CircularProgressIndicator(
                color: AppColors.primary300,
              ),
            ),
          ),
        ),
         const SizedBox(height: AppSizes.primary),
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
                  fontSize: AppSizes.primary,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey700,
                ),
              ),
            ),
      ]),
    );
  }
}
