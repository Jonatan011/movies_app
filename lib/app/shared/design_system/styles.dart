import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_palette.dart';

const baseStyle = TextStyle(
  fontFamily: 'Baloo2',
);

// Estilo para títulos principales
final titleStyle = baseStyle.copyWith(
  fontSize: 24.sp,
  fontWeight: FontWeight.w600,
  color: colorPrimary,
);

// Estilo para titulos appBar
final titleAppBarStyle = baseStyle.copyWith(
  fontSize: 18.sp,
  fontWeight: FontWeight.bold,
  color: white,
);

// Estilo para titulos
final titleDetailStyle = baseStyle.copyWith(
  fontSize: 28.sp,
  fontWeight: FontWeight.bold,
  color: white,
);

// Estilo para títulos secundarios
final titleSecondaryStyle = baseStyle.copyWith(
  fontSize: 18.sp,
  fontWeight: FontWeight.w500,
  color: white,
);

//Estilo boton primario
final styleTextButtonPrimary = baseStyle.copyWith(
  fontSize: 14.sp,
  color: white,
  fontWeight: FontWeight.w600,
);

// Estilo para cuerpo de texto
final bodyStyle = baseStyle.copyWith(
  fontSize: 16.sp,
  fontWeight: FontWeight.normal,
  color: whiteShade70,
);

// Estilo para texto de botones
final buttonTextStyle = baseStyle.copyWith(
  fontSize: 16.sp,
  fontWeight: FontWeight.w600,
  color: white,
);

// Estilo para resaltados o texto importante
final highlightStyle = baseStyle.copyWith(
  fontSize: 16.sp,
  fontWeight: FontWeight.bold,
  color: colorPrimary,
);

// Estilo para resaltados o texto importante
final textNormalStyle = baseStyle.copyWith(
  fontSize: 16.sp,
  fontWeight: FontWeight.normal,
  color: colorPrimary,
);

final sectionTitleStyle = baseStyle.copyWith(
  fontSize: 16.sp,
  fontWeight: FontWeight.bold,
  color: white,
);

final inputTextStyle = baseStyle.copyWith(
  fontSize: 16.sp,
  color: Colors.black87,
);

final subtitleTextStyle = baseStyle.copyWith(
  fontSize: 14.sp,
  fontWeight: FontWeight.normal,
  color: grey,
);

final detailItemTitleStyle = baseStyle.copyWith(
  fontSize: 16.sp,
  fontWeight: FontWeight.bold,
);

final detailItemContentStyle = baseStyle.copyWith(
  fontSize: 16.sp,
  color: Colors.black87,
);

final errorMessageStyle = baseStyle.copyWith(
  fontSize: 16.sp,
  color: red,
);

final emptyMessageStyle = baseStyle.copyWith(
  fontSize: 16.sp,
  color: grey,
);

final splashIconStyle = IconThemeData(
  size: 100.sp,
  color: white,
);

final splashTitleStyle = titleStyle.copyWith(
  fontSize: 24.sp,
  fontWeight: FontWeight.bold,
  color: white,
);
