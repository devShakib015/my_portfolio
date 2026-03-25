import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_portfolio/theme/app_colors.dart';
import 'package:my_portfolio/theme/app_typography.dart';

class MarqueeStrip extends StatefulWidget {
  final List<String> items;

  const MarqueeStrip({super.key, required this.items});

  @override
  State<MarqueeStrip> createState() => _MarqueeStripState();
}

class _MarqueeStripState extends State<MarqueeStrip>
    with SingleTickerProviderStateMixin {
  late final ScrollController _sc;
  late final Ticker _ticker;
  double _pos = 0;
  double _halfWidth = 0; // width of one copy of items

  @override
  void initState() {
    super.initState();
    _sc = ScrollController();
    _ticker = createTicker(_tick)..start();
  }

  void _tick(Duration _) {
    if (!_sc.hasClients) return;
    final pos = _sc.position;
    if (!pos.hasPixels || !pos.hasContentDimensions) return;
    if (_halfWidth == 0) {
      final max = pos.maxScrollExtent;
      if (max > 0) _halfWidth = max / 2;
      return;
    }
    _pos += 0.9;
    if (_pos >= _halfWidth) _pos = 0;
    _sc.jumpTo(_pos);
  }

  @override
  void dispose() {
    _ticker.dispose();
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Double the items for seamless loop
    final doubled = [...widget.items, ...widget.items];

    return Container(
      color: AppColors.surface,
      child: Stack(
        children: [
          SizedBox(
            height: 46,
            child: SingleChildScrollView(
              controller: _sc,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                children: doubled.asMap().entries.map((e) {
                  final isAccent = e.key % 4 == 0; // every 4th highlighted
                  return _MarqueeItem(
                    text: e.value,
                    highlighted: isAccent,
                    isLast: e.key == doubled.length - 1,
                  );
                }).toList(),
              ),
            ),
          ),
          // Fade edges
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 80,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppColors.surface,
                    AppColors.surface.withAlpha(0),
                  ]),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 80,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppColors.surface.withAlpha(0),
                    AppColors.surface,
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MarqueeItem extends StatelessWidget {
  final String text;
  final bool highlighted;
  final bool isLast;

  const _MarqueeItem({
    required this.text,
    required this.highlighted,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            text,
            style: AppTypography.caption.copyWith(
              color: highlighted ? AppColors.accent : AppColors.textSecondary,
              fontSize: 12,
              letterSpacing: 0.8,
              fontWeight: highlighted ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
        if (!isLast)
          Text(
            '◆',
            style: TextStyle(
              color: AppColors.accent.withAlpha(80),
              fontSize: 7,
            ),
          ),
      ],
    );
  }
}
