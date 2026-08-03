import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_icons.dart';
import 'package:project_2/core/constants/dimensions.dart';
import 'package:project_2/core/theme/app_theme.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isVisible;
  final bool readOnly;
  final double radius;
  final String? prefixText;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? fieldTextStyle;
  final TextStyle? hintStyle;
  final String? suffixText;
  final void Function()? suffixFunction;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final int maxLines;
  final void Function(String)? onFieldSubmitted;
  final bool isPassword;
  final String? validatorMessage;
  final Color? color;
  final Color? labelColor;
  final Color? labelFloatingColor;
  final TextInputAction? textInputAction;
  final bool edit;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final String? hintText;
  final String? label;
  final String? errorText;
  final TextStyle? errorStyle;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final bool enabled;
  final Color? enableBorderColor;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final bool? showCursor;
  final bool? enableInteractiveSelection;

  const CustomTextField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.isVisible = false,
    this.readOnly = false,
    this.enabled = true,
    this.radius = 50.0,
    this.suffixFunction,
    this.suffixIcon,
    this.errorStyle,
    this.prefixIcon,
    this.errorText,
    this.maxLines = 1,
    this.isPassword = false,
    this.validatorMessage,
    this.edit = false,
    this.validator,
    this.onTap,
    this.hintText,
    this.label,
    this.focusNode,
    this.nextFocusNode,
    this.fieldTextStyle,
    this.hintStyle,
    this.onChanged,
    this.onEditingComplete,
    this.color,
    this.inputFormatters,
    this.labelColor,
    this.labelFloatingColor,
    this.onFieldSubmitted,
    this.prefixText,
    this.suffixText,
    this.suffix,
    this.enableBorderColor,
    this.textDirection,
    this.textAlign,
    this.showCursor,
    this.enableInteractiveSelection,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(colorScheme: ColorScheme.fromSwatch()),
      child: TextFormField(
        textDirection: widget.textDirection,
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onFieldSubmitted,
        focusNode: widget.focusNode,
        textInputAction: widget.nextFocusNode != null
            ? TextInputAction.next
            : widget.textInputAction,
        controller: widget.controller,
        cursorColor: AppColors.primaryBase,
        cursorHeight: Dimensions.autoSize(20),
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword ? showPassword : false,
        maxLines: widget.maxLines,
        onTap: widget.onTap,
        style:
            widget.fieldTextStyle ??
            context.headlineSmall14.copyWith(color: Colors.black),
        showCursor: widget.showCursor,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        readOnly: widget.readOnly,
        decoration: InputDecoration(
          fillColor: widget.color ?? Colors.white,
          filled: true,
          alignLabelWithHint: true,
          labelText: widget.label,
          floatingLabelStyle: context.headlineSmall14.copyWith(
            color: widget.labelFloatingColor ?? AppColors.primaryBase,
            fontSize: Dimensions.autoSize(14),
          ),
          labelStyle: context.headlineSmall14.copyWith(
            fontSize: Dimensions.autoSize(16),
            color: widget.labelColor ?? Colors.grey,
          ),
          prefixIcon: widget.prefixIcon,
          prefixText: widget.prefixText,
          suffixText: widget.suffixText,
          suffix: widget.suffix,
          error: widget.errorText != null
              ? Center(
                  child: Text(
                    widget.errorText!,
                    style:
                        widget.errorStyle ??
                        context.headlineSmall14.copyWith(
                          color: AppColors.redShadeDeep,
                        ),
                    textAlign: TextAlign.center,
                  ),
                )
              : null,
          errorStyle:
              widget.errorStyle ??
              context.headlineSmall14.copyWith(color: AppColors.redShadeDeep),
          enabled: true,
          hintText: widget.hintText,
          hintStyle:
              widget.hintStyle ??
              context.headlineSmall14.copyWith(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(
            horizontal: Dimensions.autoSize(15),
            vertical: Dimensions.autoSize(14),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    showPassword = !showPassword;
                    setState(() {});
                  },
                  icon: SvgPicture.asset(
                    AppIcons.ar,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : widget.suffixIcon,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryBase,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffdddddd), width: 1),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.enableBorderColor ?? const Color(0xffdddddd),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
