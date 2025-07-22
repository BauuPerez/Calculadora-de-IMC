import 'package:calculador_flutter/core/app_colors.dart';
import 'package:calculador_flutter/core/text_style.dart';
import 'package:calculador_flutter/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class HeightSelector extends StatelessWidget {
  final double height;
  final Function(double) onHeightChanged;

  const HeightSelector({
    super.key,
    required this.height,
    required this.onHeightChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: AppColors.backgroundComponent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            'ALTURA',
            style: TextStyles.bodyText.copyWith(
              fontSize: isMobile ? 14 : 16,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: isMobile ? 8 : 12),
          Text(
            '${height.round()} cm',
            style: TextStyles.bodyText.copyWith(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 4,
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: isMobile ? 12 : 16,
              ),
              overlayShape: RoundSliderOverlayShape(
                overlayRadius: isMobile ? 20 : 28,
              ),
            ),
            child: Slider(
              value: height,
              min: 120,
              max: 220,
              divisions: 100,
              activeColor: AppColors.primary,
              inactiveColor: AppColors.primary.withOpacity(0.3),
              onChanged: onHeightChanged,
              label: '${height.round()} cm',
            ),
          ),
        ],
      ),
    );
  }
}
