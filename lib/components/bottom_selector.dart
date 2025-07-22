import 'package:calculador_flutter/core/app_colors.dart';
import 'package:calculador_flutter/core/text_style.dart';
import 'package:calculador_flutter/models/imc_data.dart';
import 'package:calculador_flutter/screens/imc_result-screens.dart';
import 'package:calculador_flutter/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class BottomSelector extends StatelessWidget {
  final ImcData imcData;

  const BottomSelector({
    super.key,
    required this.imcData,
  });

  void _navigateToResults(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImcResultScreen(imcData: imcData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return SizedBox(
      width: double.infinity,
      height: isMobile ? 56 : 64,
      child: ElevatedButton(
        onPressed: () => _navigateToResults(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: AppColors.primary.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'CALCULAR IMC',
          style: TextStyles.bodyText.copyWith(
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}