import 'package:calculador_flutter/core/app_colors.dart';
import 'package:calculador_flutter/core/text_style.dart';
import 'package:calculador_flutter/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final String selectedGender;
  final Function(String) onGenderChanged;

  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    
    return Row(
      children: [
        Expanded(
          child: _GenderCard(
            title: 'HOMBRE',
            icon: Icons.male,
            isSelected: selectedGender == 'male',
            onTap: () => onGenderChanged('male'),
            isMobile: isMobile,
          ),
        ),
        SizedBox(width: isMobile ? 12 : 16),
        Expanded(
          child: _GenderCard(
            title: 'MUJER',
            icon: Icons.female,
            isSelected: selectedGender == 'female',
            onTap: () => onGenderChanged('female'),
            isMobile: isMobile,
          ),
        ),
      ],
    );
  }
}

class _GenderCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isMobile;

  const _GenderCard({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(isMobile ? 16 : 24),
        decoration: BoxDecoration(
          color: isSelected 
            ? AppColors.primary.withOpacity(0.3)
            : AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(12),
          border: isSelected
            ? Border.all(color: AppColors.primary, width: 2)
            : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: isMobile ? 40 : 60,
              color: isSelected ? AppColors.primary : Colors.white,
            ),
            SizedBox(height: isMobile ? 8 : 12),
            Text(
              title,
              style: TextStyles.bodyText.copyWith(
                fontSize: isMobile ? 14 : 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? AppColors.primary : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}