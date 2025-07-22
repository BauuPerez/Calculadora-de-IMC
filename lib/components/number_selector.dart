import 'package:calculador_flutter/core/app_colors.dart';
import 'package:calculador_flutter/core/text_style.dart';
import 'package:calculador_flutter/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class NumberSelector extends StatelessWidget {
  final double weight;
  final int age;
  final Function(double) onWeightChanged;
  final Function(int) onAgeChanged;

  const NumberSelector({
    super.key,
    required this.weight,
    required this.age,
    required this.onWeightChanged,
    required this.onAgeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final spacing = isMobile ? 12.0 : 16.0;

    return isMobile
        ? Column(
            children: [
              _NumberCard(
                title: 'PESO',
                value: '${weight.round()} kg',
                onIncrement: () => onWeightChanged(
                  weight < 200 ? weight + 1 : weight
                ),
                onDecrement: () => onWeightChanged(
                  weight > 20 ? weight - 1 : weight
                ),
                isMobile: isMobile,
              ),
              SizedBox(height: spacing),
              _NumberCard(
                title: 'EDAD',
                value: '$age años',
                onIncrement: () => onAgeChanged(age < 120 ? age + 1 : age),
                onDecrement: () => onAgeChanged(age > 1 ? age - 1 : age),
                isMobile: isMobile,
              ),
            ],
          )
        : Row(
            children: [
              Expanded(
                child: _NumberCard(
                  title: 'PESO',
                  value: '${weight.round()} kg',
                  onIncrement: () => onWeightChanged(
                    weight < 200 ? weight + 1 : weight
                  ),
                  onDecrement: () => onWeightChanged(
                    weight > 20 ? weight - 1 : weight
                  ),
                  isMobile: isMobile,
                ),
              ),
              SizedBox(width: spacing),
              Expanded(
                child: _NumberCard(
                  title: 'EDAD',
                  value: '$age años',
                  onIncrement: () => onAgeChanged(age < 120 ? age + 1 : age),
                  onDecrement: () => onAgeChanged(age > 1 ? age - 1 : age),
                  isMobile: isMobile,
                ),
              ),
            ],
          );
  }
}

class _NumberCard extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final bool isMobile;

  const _NumberCard({
    required this.title,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: AppColors.backgroundComponent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyles.bodyText.copyWith(
              fontSize: isMobile ? 14 : 16,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: isMobile ? 8 : 12),
          Text(
            value,
            style: TextStyles.bodyText.copyWith(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _CircularButton(
                icon: Icons.remove,
                onPressed: onDecrement,
                isMobile: isMobile,
              ),
              _CircularButton(
                icon: Icons.add,
                onPressed: onIncrement,
                isMobile: isMobile,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CircularButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool isMobile;

  const _CircularButton({
    required this.icon,
    required this.onPressed,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(isMobile ? 24 : 32),
      child: InkWell(
        borderRadius: BorderRadius.circular(isMobile ? 24 : 32),
        onTap: onPressed,
        child: Container(
          width: isMobile ? 48 : 64,
          height: isMobile ? 48 : 64,
          child: Icon(
            icon,
            color: Colors.white,
            size: isMobile ? 24 : 32,
          ),
        ),
      ),
    );
  }
}