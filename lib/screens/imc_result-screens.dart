import 'package:calculador_flutter/core/app_colors.dart';
import 'package:calculador_flutter/core/text_style.dart';
import 'package:calculador_flutter/models/imc_data.dart';
import 'package:calculador_flutter/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class ImcResultScreen extends StatelessWidget {
  final ImcData imcData;

  const ImcResultScreen({
    super.key,
    required this.imcData,
  });

  @override
  Widget build(BuildContext context) {
    final imc = imcData.calculateIMC();
    final category = imcData.getIMCCategory();
    final color = imcData.getIMCColor();
    final isMobile = ResponsiveUtils.isMobile(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Resultado IMC',
          style: TextStyles.bodyText.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.backgroundComponent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: ResponsiveUtils.getHorizontalPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: ResponsiveUtils.getVerticalSpacing(context) * 2),
              
              // Tarjeta principal con el resultado
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isMobile ? 24 : 32),
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      'TU IMC ES',
                      style: TextStyles.bodyText.copyWith(
                        fontSize: isMobile ? 16 : 18,
                        letterSpacing: 1.2,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: isMobile ? 16 : 24),
                    
                    // Número del IMC
                    Text(
                      imc.toStringAsFixed(1),
                      style: TextStyles.numberLarge.copyWith(
                        fontSize: isMobile ? 64 : 80,
                        color: color,
                      ),
                    ),
                    SizedBox(height: isMobile ? 12 : 16),
                    
                    // Categoría
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16 : 24,
                        vertical: isMobile ? 8 : 12,
                      ),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: color, width: 2),
                      ),
                      child: Text(
                        category.toUpperCase(),
                        style: TextStyles.bodyText.copyWith(
                          fontSize: isMobile ? 14 : 16,
                          fontWeight: FontWeight.bold,
                          color: color,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: ResponsiveUtils.getVerticalSpacing(context) * 2),
              
              // Información adicional
              _buildInfoCard(
                title: 'DATOS INGRESADOS',
                content: Column(
                  children: [
                    _buildInfoRow('Altura:', '${imcData.height.round()} cm', isMobile),
                    _buildInfoRow('Peso:', '${imcData.weight.round()} kg', isMobile),
                    _buildInfoRow('Edad:', '${imcData.age} años', isMobile),
                    _buildInfoRow('Género:', imcData.gender == 'male' ? 'Hombre' : 'Mujer', isMobile),
                  ],
                ),
                isMobile: isMobile,
              ),
              
              SizedBox(height: ResponsiveUtils.getVerticalSpacing(context) * 2),
              
              // Botón para recalcular
              SizedBox(
                width: double.infinity,
                height: isMobile ? 56 : 64,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
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
                    'RECALCULAR',
                    style: TextStyles.button.copyWith(
                      fontSize: isMobile ? 16 : 18,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: ResponsiveUtils.getVerticalSpacing(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required Widget content,
    required bool isMobile,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 20 : 24),
      decoration: BoxDecoration(
        color: AppColors.backgroundComponent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.bodyText.copyWith(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          content,
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 4 : 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyles.bodyText.copyWith(
              fontSize: isMobile ? 14 : 16,
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            value,
            style: TextStyles.bodyText.copyWith(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}