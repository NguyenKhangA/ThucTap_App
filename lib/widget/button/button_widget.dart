import 'package:flutter/material.dart';

// onclick su kien onpress
// text , textColor text and text color
// buttonColor button background color
// clickColor color when click
// leadingIcon for Icon before text in button
// trailingIcon for Icon after text in button

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final VoidCallback onClick;

  final Color? buttonColor;
  final Widget? buttonIcon;
  final bool? isLeadingIcon;
  const CustomButton({
    this.text,
    this.textColor,
    required this.onClick,
    this.buttonColor,
    this.buttonIcon,
    this.isLeadingIcon = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.4)),
        backgroundColor: buttonColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text ?? '',
            style: TextStyle(
                color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadingIconButton(Widget? buttonIcon, bool isLeadingIcon) {
    if (buttonIcon != null && isLeadingIcon == true) {
      return Row(
        children: <Widget>[
          buttonIcon,
          const SizedBox(
            width: 8,
          )
        ],
      );
    }
    return Container();
  }
}
