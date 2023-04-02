import 'package:flutter/material.dart';

class AppColor {
  static const Color background = Color(0xFFf9fafb);
  static const Color pdaxLogo = Color(0xff5ecc88);

  static const Color pdaxText = Color(0xff20244f);
  static const Color greyText = Color(0xff7f8fa4);
  static const Color darkGreyText = Color.fromARGB(255, 72, 82, 95);

  static const Color kdisabledbutton = Color(0xffcccccc);

  static const Color kprimaryColor = Color(0xFF00CE89);
  static const Color kprimaryTextColor = Color(0xFF161C2C);
  static const Color ksecondaryTextColor = Color(0xFFD2D2D2);
  static const Color kTextFieldColor = Color(0xFF878b93);
  static const Color kdarkPrimaryColor = Color.fromARGB(255, 1, 23, 16);

  static const Color kpositiveButtonTextColor = Colors.white;
  static const Color knegativeButtonTextColor = AppColor.kprimaryColor;

  static const Color kprimaryBGColor = Color(0xFFF9FAfB);
  static const Color ksecondaryBGColor = Color(0xFFFFFFFF);

  static const Color kprimaryScrollbarColor = Color(0xFFE8E9ED);
  static const Color kprimaryInputBorderColor = Color(0xFFE8E9ED);
  static const Color kprimaryInputFillColor = Color(0xFFF9FAFB);

  static const Color kloginFooterTextColor = Color(0xFF878B93);
  static const Color kmainLocTextColor = Color(0xFF878B93);
  static const Color ksubLocTextColor = Color(0xFF1F2552);

  static const Color kprimaryErrorColor = Color(0xFFBA495A);

  static const Color kprimaryAppbarBorderColor = Color(0xFFE5E5E5);

  static const Color kaccountMenuTextColor = Color(0xFF1F2552);
  static const Color ksideMenuTextColor = Color(0xFF1F2552);
  static const Color ksideMenuActiveBGColor = Color(0xFFCBF5E7);

  static const Color kfooterListPerPageCountTextColor = Color(0xFF0A376E);

  static const Color pendingColor = Color(0xffffc44d); //#ffc44d

  static const Color shimmerBaseTrans = Colors.transparent;
  static const Color shimmerBase = Color.fromRGBO(225, 225, 225, 1.0);
  static const Color shimmerHighlight = Color.fromRGBO(245, 245, 245, 1.0);

  /// https://stackoverflow.com/questions/62432229/how-to-assign-hexadecimal-color-code-in-primaryswatch-in-flutter
  static MaterialColor buildMaterialColor(Color color) {
    List<double> strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    // ignore: avoid_function_literals_in_foreach_calls
    strengths.forEach((double strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  // NEW
  static const Color brand50 = Color(0xfff3fff6);
  static const Color brand100 = Color(0xffd2f9db);
  static const Color brand200 = Color(0xffa7f4c1);
  static const Color brand300 = Color(0xff75e0a4);
  static const Color brand400 = Color(0xff4ec18c);
  static const Color brand500 = Color(0xff20996d);
  static const Color brand600 = Color(0xff178366);
  static const Color brand700 = Color(0xff106e5e);
  static const Color brand800 = Color(0xff0a5853);
  static const Color gray50 = Color(0xfff7fafc);
  static const Color brand900 = Color(0xff064749);
  static const Color gray100 = Color(0xffedf2f7);
  static const Color gray200 = Color(0xffe2e8f0);
  static const Color gray300 = Color(0xffcbd5e0);
  static const Color gray400 = Color(0xffa0aec0);
  static const Color gray600 = Color(0xff4a5568);
  static const Color gray500 = Color(0xff718096);
  static const Color gray700 = Color(0xff2d3748);
  static const Color gray900 = Color(0xff171923);
  static const Color blackAlpha50 = Color.fromRGBO(0, 0, 0, 0.04);
  static const Color blackAlpha200 = Color.fromRGBO(0, 0, 0, 0.08);
  static const Color blackAlpha100 = Color.fromRGBO(0, 0, 0, 0.06);
  static const Color blackAlpha300 = Color.fromRGBO(0, 0, 0, 0.16);
  static const Color blackAlpha400 = Color.fromRGBO(0, 0, 0, 0.24);
  static const Color blackAlpha500 = Color.fromRGBO(0, 0, 0, 0.36);
  static const Color gray800 = Color(0xff1a202c);
  static const Color blackAlpha700 = Color.fromRGBO(0, 0, 0, 0.64);
  static const Color blackAlpha600 = Color.fromRGBO(0, 0, 0, 0.48);
  static const Color blackAlpha800 = Color.fromRGBO(0, 0, 0, 0.8);
  static const Color blackAlpha900 = Color.fromRGBO(0, 0, 0, 0.92);
  static const Color whiteAlpha50 = Color.fromRGBO(255, 255, 255, 0.04);
  static const Color whiteAlpha200 = Color.fromRGBO(255, 255, 255, 0.08);
  static const Color whiteAlpha100 = Color.fromRGBO(255, 255, 255, 0.06);
  static const Color whiteAlpha400 = Color.fromRGBO(255, 255, 255, 0.24);
  static const Color whiteAlpha300 = Color.fromRGBO(255, 255, 255, 0.16);
  static const Color whiteAlpha500 = Color.fromRGBO(255, 255, 255, 0.36);
  static const Color whiteAlpha600 = Color.fromRGBO(255, 255, 255, 0.48);
  static const Color whiteAlpha700 = Color.fromRGBO(255, 255, 255, 0.64);
  static const Color whiteAlpha800 = Color.fromRGBO(255, 255, 255, 0.8);
  static const Color whiteAlpha900 = Color.fromRGBO(255, 255, 255, 0.92);
  static const Color red50 = Color(0xfffff5f5);
  static const Color red100 = Color(0xfffed7d7);
  static const Color red200 = Color(0xfffeb2b2);
  static const Color red300 = Color(0xfffc8181);
  static const Color red400 = Color(0xfff56565);
  static const Color red500 = Color(0xffe53e3e);
  static const Color red600 = Color(0xffc53030);
  static const Color red700 = Color(0xff9b2c2c);
  static const Color red800 = Color(0xff822727);
  static const Color red900 = Color(0xff63171b);
  static const Color blue50 = Color(0xffebf8ff);
  static const Color blue100 = Color(0xffbee3f8);
  static const Color blue200 = Color(0xff90cdf4);
  static const Color blue400 = Color(0xff4299e1);
  static const Color blue300 = Color(0xff63b3ed);
  static const Color blue500 = Color(0xff3182ce);
  static const Color blue600 = Color(0xff2b6cb0);
  static const Color blue700 = Color(0xff2c5282);
  static const Color blue800 = Color(0xff2a4365);
  static const Color orange50 = Color(0xfffffaf0);
  static const Color blue900 = Color(0xff1a365d);
  static const Color orange100 = Color(0xfffeebcb);
  static const Color orange200 = Color(0xfffbd38d);
  static const Color orange300 = Color(0xfff6ad55);
  static const Color orange400 = Color(0xffed8936);
  static const Color orange500 = Color(0xffdd6b20);
  static const Color orange600 = Color(0xffc05621);
  static const Color orange700 = Color(0xff9c4221);
  static const Color orange800 = Color(0xff7b341e);
  static const Color orange900 = Color(0xff652b19);
  static const Color pink800 = Color(0xff702459);
  static const Color pink700 = Color(0xff97266d);
  static const Color pink600 = Color(0xffb83280);
  static const Color pink500 = Color(0xffd53f8c);
  static const Color pink300 = Color(0xfff687b3);
  static const Color pink400 = Color(0xffed64a6);
  static const Color pink200 = Color(0xfffbb6ce);
  static const Color pink100 = Color(0xfffed7e2);
  static const Color pink50 = Color(0xfffff5f7);
  static const Color purple900 = Color(0xff322659);
  static const Color purple800 = Color(0xff44337a);
  static const Color purple700 = Color(0xff553c9a);
  static const Color purple600 = Color(0xff6b46c1);
  static const Color purple500 = Color(0xff805ad5);
  static const Color pink900 = Color(0xff521b41);
  static const Color purple400 = Color(0xff9f7aea);
  static const Color purple300 = Color(0xffb794f4);
  static const Color purple200 = Color(0xffd6bcfa);
  static const Color purple100 = Color(0xffe9d8fd);
  static const Color purple50 = Color(0xfffaf5ff);
  static const Color cyan900 = Color(0xff065666);
  static const Color cyan700 = Color(0xff0987a0);
  static const Color cyan600 = Color(0xff00a3c4);
  static const Color cyan800 = Color(0xff086f83);
  static const Color cyan500 = Color(0xff00b5d8);
  static const Color cyan400 = Color(0xff0bc5ea);
  static const Color cyan300 = Color(0xff76e4f7);
  static const Color cyan200 = Color(0xff9decf9);
  static const Color cyan100 = Color(0xffc4f1f9);
  static const Color cyan50 = Color(0xffedfdfd);
  static const Color teal900 = Color(0xff1d4044);
  static const Color teal800 = Color(0xff234e52);
  static const Color teal700 = Color(0xff285e61);
  static const Color teal600 = Color(0xff2c7a7b);
  static const Color teal500 = Color(0xff319795);
  static const Color teal400 = Color(0xff38b2ac);
  static const Color teal300 = Color(0xff4fd1c5);
  static const Color teal100 = Color(0xffb2f5ea);
  static const Color teal50 = Color(0xffe6fffa);
  static const Color teal200 = Color(0xff81e6d9);
  static const Color green900 = Color(0xff1c4532);
  static const Color green800 = Color(0xff22543d);
  static const Color green700 = Color(0xff276749);
  static const Color green600 = Color(0xff25855a);
  static const Color green400 = Color(0xff48bb78);
  static const Color green500 = Color(0xff38a169);
  static const Color green300 = Color(0xff68d391);
  static const Color green200 = Color(0xff9ae6b4);
  static const Color green100 = Color(0xffc6f6d5);
  static const Color green50 = Color(0xfff0fff4);
  static const Color yellow800 = Color(0xff744210);
  static const Color yellow900 = Color(0xff5f370e);
  static const Color yellow700 = Color(0xff975a16);
  static const Color yellow600 = Color(0xffb7791f);
  static const Color yellow500 = Color(0xffd69e2e);
  static const Color yellow400 = Color(0xffecc94b);
  static const Color yellow300 = Color(0xfff6e05e);
  static const Color yellow200 = Color(0xfffaf089);
  static const Color yellow100 = Color(0xfffefcbf);
  static const Color yellow50 = Color(0xfffffff0);
}
