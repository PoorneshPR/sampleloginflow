import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? buttonText;
  final double? width;
  final Widget? loaderWidget;
  final double? height;
  final double? borderRadiusUser;
  final TextStyle? fontStyle;
  final ButtonStyle? buttonStyle;
  const CommonButton(
      {Key? key,
        this.onPressed,
        this.width,
        this.height,
        this.buttonText,
        this.loaderWidget,
        this.borderRadiusUser,
        this.fontStyle,
        this.buttonStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40,
      width: width ,
      child: ElevatedButton(
        style: buttonStyle ??
            ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadiusUser??25 ),
                  )),
              elevation: MaterialStateProperty.all<double>(0),
            ),
        onPressed: onPressed,
        child: loaderWidget ??
            Text(
              buttonText ?? '',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: fontStyle ,
            ),
      ),
    );
  }
}