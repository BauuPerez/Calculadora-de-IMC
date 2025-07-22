import 'package:calculador_flutter/components/bottom_selector.dart';
import 'package:calculador_flutter/components/gender_selector.dart';
import 'package:calculador_flutter/components/height_selector.dart';
import 'package:calculador_flutter/components/number_selector.dart';
import 'package:calculador_flutter/core/app_colors.dart';
import 'package:calculador_flutter/core/text_style.dart';
import 'package:calculador_flutter/models/imc_data.dart';
import 'package:calculador_flutter/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  // Estado de la aplicación
  double _height = 170.0;
  double _weight = 70.0;
  int _age = 25;
  String _selectedGender = 'male';

  // Getters para acceso limpio a los datos
  ImcData get _imcData => ImcData(
    height: _height,
    weight: _weight,
    age: _age,
    gender: _selectedGender,
  );

  // Métodos para actualizar el estado
  void _updateHeight(double newHeight) {
    setState(() => _height = newHeight);
  }

  void _updateWeight(double newWeight) {
    setState(() => _weight = newWeight);
  }

  void _updateAge(int newAge) {
    setState(() => _age = newAge);
  }

  void _updateGender(String newGender) {
    setState(() => _selectedGender = newGender);
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final verticalSpacing = ResponsiveUtils.getVerticalSpacing(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: ResponsiveUtils.getHorizontalPadding(context),
          child: isDesktop 
            ? _buildDesktopLayout(verticalSpacing)
            : _buildMobileLayout(verticalSpacing),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Calculadora IMC',
        style: TextStyles.bodyText.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: AppColors.backgroundComponent,
      elevation: 0,
      centerTitle: true,
    );
  }

  Widget _buildMobileLayout(double spacing) {
    return Column(
      children: [
        SizedBox(height: spacing),
        GenderSelector(
          selectedGender: _selectedGender,
          onGenderChanged: _updateGender,
        ),
        SizedBox(height: spacing),
        HeightSelector(
          height: _height,
          onHeightChanged: _updateHeight,
        ),
        SizedBox(height: spacing),
        NumberSelector(
          weight: _weight,
          age: _age,
          onWeightChanged: _updateWeight,
          onAgeChanged: _updateAge,
        ),
        SizedBox(height: spacing * 2),
        BottomSelector(
          imcData: _imcData,
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(double spacing) {
    return Column(
      children: [
        SizedBox(height: spacing),
        GenderSelector(
          selectedGender: _selectedGender,
          onGenderChanged: _updateGender,
        ),
        SizedBox(height: spacing),
        Row(
          children: [
            Expanded(
              child: HeightSelector(
                height: _height,
                onHeightChanged: _updateHeight,
              ),
            ),
            SizedBox(width: spacing),
            Expanded(
              child: NumberSelector(
                weight: _weight,
                age: _age,
                onWeightChanged: _updateWeight,
                onAgeChanged: _updateAge,
              ),
            ),
          ],
        ),
        SizedBox(height: spacing * 2),
        SizedBox(
          width: 400, // Ancho fijo para desktop
          child: BottomSelector(
            imcData: _imcData,
          ),
        ),
      ],
    );
  }
}