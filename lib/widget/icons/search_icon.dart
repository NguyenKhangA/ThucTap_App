import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildSearchIcon({required String iconSVGPath}) {
  return Container(
    height: 24,
    width: 24,
    child: SvgPicture.asset(
      iconSVGPath,
      color: const Color(0xff000000).withOpacity(0.7),
    ),
  );
}
