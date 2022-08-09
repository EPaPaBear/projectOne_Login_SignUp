import 'package:flutter/material.dart';
import 'package:test/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.onTap,
      this.width,
      this.margin,
      this.text});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  VoidCallback? onTap;

  double? width;

  EdgeInsetsGeometry? margin;

  String? text;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: getHorizontalSize(width ?? 0),
        margin: margin,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: Text(
          text ?? "",
          textAlign: TextAlign.center,
          style: _setFontStyle(),
        ),
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll11:
        return getPadding(
          all: 11,
        );
      default:
        return getPadding(
          all: 14,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.OutlinePinkA100:
        return null;
      default:
        return ColorConstant.purple400;
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.OutlinePinkA100:
        return Border.all(
          color: ColorConstant.pinkA100,
          width: getHorizontalSize(
            6.00,
          ),
        );
      case ButtonVariant.FillPurple400:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.PoppinsExtraBold24:
        return TextStyle(
          color: ColorConstant.pinkA100,
          fontSize: getFontSize(
            24,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w800,
        );
      default:
        return TextStyle(
          color: ColorConstant.gray50,
          fontSize: getFontSize(
            24,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w800,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder20,
}

enum ButtonPadding {
  PaddingAll11,
  PaddingAll14,
}

enum ButtonVariant {
  FillPurple400,
  OutlinePinkA100,
}

enum ButtonFontStyle {
  PoppinsExtraBold24Gray50,
  PoppinsExtraBold24,
}
