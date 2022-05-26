import 'package:flutter/material.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({
    Key? key,
    required this.visible,
    required this.child,
  }) : super(key: key);

  final bool visible;
  final Widget child;

  @override
  _SkeletonState createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1500));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.addListener(_onSkeletonChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onSkeletonChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onSkeletonChanged() {
    if (widget.visible) {
      setState(() {
        // needed to update the skeleton painting.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.visible) {
      return widget.child;
    }

    final renderObject = context.findRenderObject();

    if (renderObject == null) {
      return const SizedBox();
    }

    final gradient = LinearGradient(
      colors: const [
        Color(0xFFEBEBF4),
        Color(0xFFF4F4F4),
        Color(0xFFEBEBF4),
      ],
      stops: const [
        0.1,
        0.3,
        0.4,
      ],
      begin: const Alignment(-1.0, -0.3),
      end: const Alignment(1.0, 0.3),
      tileMode: TileMode.clamp,
      transform: _SlidingGradientTransform(percent: _controller.value),
    );
    final renderBoxContext = renderObject as RenderBox;
    final size = renderBoxContext.size;
    final offset = renderBoxContext.localToGlobal(
      Offset.zero,
      ancestor: renderBoxContext,
    );

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offset.dx,
            -offset.dy,
            size.width,
            size.height,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.percent,
  });

  final double percent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * percent, 0, 0);
  }
}
