import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sampleauthroll/common/fontstyle.dart';
import '../../utils/hexcolor.dart';

class CommonTextFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextInputType? inputType;
  final Function? validator;
  final Function? onTap;
  final Function? onEditingComplete;
  final bool isObscure;
  final Widget? prefix;
  final TextStyle? hintFontStyle;
  final Function? onSaved;
  final void Function(String)? onChanged;
  final TextInputAction? inputAction;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final bool autoFocus;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final bool defaultFont;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? customIcon;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final bool textEnabled;
  final bool textIsReadOnly;
  final double? prefixIconWidth;
  final bool addressHintStyle;
  final bool disableFocusNode;
  final bool removeOutlineBorder;

  const CommonTextFormField(
      {Key? key,
      this.hintText,
      this.labelText,
      this.prefix,
      this.inputType,
      this.keyboardType,
      this.validator,
      this.hintFontStyle,
      this.onTap,
      this.onEditingComplete,
      this.autoFocus = false,
      this.isObscure = false,
      this.onSaved,
      this.onChanged,
      this.inputAction,
      this.inputFormatters,
      this.controller,
      this.maxLength,
      this.maxLines,
      this.defaultFont = true,
      this.prefixIcon,
      this.contentPadding,
      this.suffixIcon,
      this.focusNode,
      this.customIcon,
      this.textEnabled = true,
      this.textIsReadOnly = false,
      this.addressHintStyle = false,
      this.disableFocusNode = false,
      this.removeOutlineBorder = false,
      this.prefixIconWidth})
      : super(key: key);

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  ValueNotifier<bool> enableLabel = ValueNotifier(false);
  bool enableObscure = true;

  @override
  Widget build(BuildContext context) {
    final underLineBorder = !widget.removeOutlineBorder
        ? UnderlineInputBorder(
        borderSide: BorderSide(
          color: HexColor("#0785f4"),
          width: 2.0,
        ),
       )
        : null;
    final underLineErrorBorder = !widget.removeOutlineBorder
        ? UnderlineInputBorder(
            borderSide: BorderSide(
              color: HexColor("#FC6261"),
              width: 1.0,
            ),
           )
        : null;
    final underlineBorderWithoutSelection = !widget.removeOutlineBorder
        ? UnderlineInputBorder(
            borderSide: BorderSide(
              color: HexColor("#D9E3E3"),
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)))
        : null;
    return Theme(
      data: ThemeData(
          hintColor: HexColor('#696969'),
          primarySwatch: Colors.blue,
          fontFamily: FontStyle.themeFont,
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                  systemNavigationBarIconBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.dark)),
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: Colors.black)),
      child: TextFormField(
        cursorColor: Colors.blue,
        enabled: widget.textEnabled,
        readOnly: widget.textIsReadOnly,
        focusNode: widget.focusNode,
        maxLines: widget.maxLines ?? 1,
        textInputAction: widget.inputAction,
        keyboardType: widget.inputType,
        controller: widget.controller,
        style: FontStyle.black12Medium,
        validator: widget.validator == null
            ? (val) {
                return null;
              }
            : (val) => widget.validator!(val),
        onChanged: widget.onChanged ??
            (val) {
              if (widget.controller!.text.isNotEmpty) {
                enableLabel.value = true;
              } else {
                enableLabel.value = false;
              }
            },
        autocorrect: false,
        enableSuggestions: false,
        obscureText: widget.isObscure ? enableObscure : false,
        inputFormatters: widget.inputFormatters,
        maxLength: widget.maxLength,
        autofocus: widget.autoFocus,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          prefixIconConstraints:
              BoxConstraints(maxWidth: widget.prefixIconWidth ?? 55),
          isDense: false,
          prefixIcon: widget.prefixIcon,
          icon: widget.customIcon,
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          border: underlineBorderWithoutSelection,
          counterText: "",
          enabledBorder:underlineBorderWithoutSelection,
          disabledBorder: underlineBorderWithoutSelection,
          contentPadding: widget.contentPadding ?? const EdgeInsets.all(20),
          errorBorder: underLineErrorBorder,
          focusedBorder: underLineBorder,
          focusedErrorBorder: underLineErrorBorder,
          labelText: widget.labelText,
          labelStyle: FontStyle.blue14Medium,
          hintStyle: FontStyle.grey12Medium_556879,
          hintText: widget.hintText,
          prefix: widget.prefix,
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}
