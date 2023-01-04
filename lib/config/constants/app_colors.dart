import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  static const Color cardBgColor = Color(0xFF0A101C);
  static const Color categoryCountColor = Color(0xFF345290);
  static const Color backgroundColor = Color(0xFF03060B);
  static const Color categoryBgColor = Color(0xFF0D1526);
  static const Color accentColor = Colors.white;
  static const Color borderColor = Colors.white38;
  static const Color selectedColor = Color(0xFF2F80ED);
  static const Color cartBgColor = Color(0xFF080E19);
  static const Color textFieldBgColor = Color(0xFF0F192C);
  static const Color redText = Color(0xFFEB5757);
  static  Color shadowColor = const Color(0xFF122345).withOpacity(.39);
  static Color appBarBgColor = const Color(0xFF060A12).withOpacity(.85);

  static List<Color> cartGrColors = [
    const Color(0xff383E4F),
    const Color(0xff383D4D),
    const Color(0xff5A6278),
    const Color(0xff1A1E2A),
  ];

  static Gradients gradients = const Gradients();

  static getPrimaryColor(int num) => Color(int.parse('0x${num}00845A'));

  static PrimaryColor primaryLight = const PrimaryColor(
    0xFF00845A,
    <int, Color>{
      100: Color(0xFF00845A),
      50: Color(0xFFF2FDF5),
    },
  );

  static BaseColor baseLight = BaseColor(
    0xFF16A249,
    <int, Color>{
      100: Colors.white,
      50: const Color(0xFFF4F4F4),
      80: Colors.white.withOpacity(.8),
      40: Colors.white.withOpacity(.4),
      20: Colors.white.withOpacity(.2),
      60: Colors.white.withOpacity(.6),
    },
  );

  static TextColor textColor = TextColor();
}

class BaseColor extends ColorSwatch<int> {
  const BaseColor(super.primary, super.swatch);

  Color get shade100 => this[100]!;

  Color get shade50 => this[50]!;

  Color get shade40 => this[40]!;

  Color get shade80 => this[80]!;

  Color get shade20 => this[20]!;

  Color get shade60 => this[60]!;
}

class PrimaryColor extends ColorSwatch<int> {
  const PrimaryColor(super.primary, super.swatch);

  Color get shade100 => this[100]!;

  Color get shade50 => this[50]!;
}

class TextColor extends ColorSwatch<int> {
  TextColor()
      : super(
          0xFF332f2e,
          <int, Color>{
            1: const Color(0xFFFFFFFF),
            2: const Color(0xFF4C4C4F),
            3: const Color(0xffe8e8e8),
            4: const Color(0xffCAF99C),
            26: Colors.black26,
            5: const Color(0xffF58965),
            6: const Color(0xff9D9898),
            7: const Color(0xff1D1D1D).withOpacity(.6),
          },
        );

  Color get shade1 => this[1]!;
  Color get shade2 => this[2]!;
  Color get shade3 => this[3]!;
  Color get shade4 => this[4]!;
  Color get shade26 => this[26]!;
  Color get shade5 => this[5]!;
  Color get shade6 => this[6]!;
  Color get shade7 => this[7]!;
}

class Gradients {
  const Gradients();

  LinearGradient get welcome => LinearGradient(colors: [
        const Color(0xFF000000).withOpacity(0),
        const Color(0xFF000000),
      ], begin: Alignment.topRight);

  LinearGradient get tabbarGr => LinearGradient(colors: [
        const Color(0xFFFFFFFF).withOpacity(.2),
        const Color(0xFFFFFFFF).withOpacity(.2),
      ], begin: Alignment.topRight);

  LinearGradient get trendingGr => LinearGradient(colors: [
        const Color(0xFF7264FF).withOpacity(.7),
        const Color(0xFF7264FF),
      ], begin: Alignment.bottomRight);
}
