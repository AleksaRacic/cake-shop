import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
        fontSize: 16.fSize,
      );
  static get bodyLargeMontserratBlack900 =>
      theme.textTheme.bodyLarge!.montserrat.copyWith(
        color: appTheme.black900,
        fontSize: 16.fSize,
      );
  static get bodyMediumBevanGray800 =>
      theme.textTheme.bodyMedium!.bevan.copyWith(
        color: appTheme.gray800,
        fontSize: 15.fSize,
      );
  static get bodyMediumMontserratBlack900 =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: appTheme.black900,
        fontSize: 13.fSize,
      );
  // Headline text style
  static get headlineLargeLatoPrimaryContainer =>
      theme.textTheme.headlineLarge!.lato.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallGray900 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray900,
        fontSize: 25.fSize,
        fontWeight: FontWeight.w500,
      );
  static get headlineSmallIBMPlexSansPink800 =>
      theme.textTheme.headlineSmall!.iBMPlexSans.copyWith(
        color: appTheme.pink800,
      );
  static get headlineSmallLatoGray80002 =>
      theme.textTheme.headlineSmall!.lato.copyWith(
        color: appTheme.gray80002,
        fontSize: 25.fSize,
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallLatoPrimaryContainer =>
      theme.textTheme.headlineSmall!.lato.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 25.fSize,
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallPrimary => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get headlineSmallRegular => theme.textTheme.headlineSmall!.copyWith(
        fontSize: 25.fSize,
        fontWeight: FontWeight.w400,
      );
  // Label text style
  static get labelLargeManropeWhiteA700 =>
      theme.textTheme.labelLarge!.manrope.copyWith(
        color: appTheme.whiteA700,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeMontserratff000000 =>
      theme.textTheme.labelLarge!.montserrat.copyWith(
        color: Color(0XFF000000),
        fontWeight: FontWeight.w600,
      );
  // Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeGray5001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray5001,
      );
  static get titleLargeGray80001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray80001,
      );
  static get titleLargeGray90001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray90001,
      );
  static get titleLargeIBMPlexSansBlack900 =>
      theme.textTheme.titleLarge!.iBMPlexSans.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeLatoPrimaryContainer =>
      theme.textTheme.titleLarge!.lato.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeMontserratffdd5471 =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: Color(0XFF000011),
        fontWeight: FontWeight.w400,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumPink800 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.pink800,
        fontSize: 16.fSize,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );
}

extension on TextStyle {
  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get bevan {
    return copyWith(
      fontFamily: 'Bevan',
    );
  }

  TextStyle get iBMPlexSans {
    return copyWith(
      fontFamily: 'IBM Plex Sans',
    );
  }

  TextStyle get manrope {
    return copyWith(
      fontFamily: 'Manrope',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }
}
