

import 'package:flutter/material.dart';


class BottomCentertPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(size.width / 4, size.height)
    ..lineTo(size.width / 4 * 3, size.height)
    ..lineTo(size.width / 2, size.height / 2);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class BottomLeftPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(size.width, size.height / 3 * 2)
    ..lineTo(size.width, size.height)
    ..lineTo(size.width / 4 * 3, size.height)
    ..lineTo(size.width / 2, size.height / 2);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class BottomRightPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, size.height / 3 * 2)
    ..lineTo(0, size.height)
    ..lineTo(size.width / 4, size.height)
    ..lineTo(size.width / 2, size.height / 2);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CenterRighttPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(size.width, size.height / 3)
    ..lineTo(size.width / 2, size.height / 2)
    ..lineTo(size.width, size.height / 3 * 2);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CenterLeftPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, size.height / 3)
    ..lineTo(size.width / 2, size.height / 2)
    ..lineTo(0, size.height / 3 * 2);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class TopRightPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(size.width / 2, 0)
    ..lineTo(size.width, 0)
    ..lineTo(size.width, size.height / 3)
    ..lineTo(size.width / 2, size.height / 2);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class TopLeftPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..lineTo(size.width / 2, 0)
    ..lineTo(size.width / 2, size.height / 2)
    ..lineTo(0, size.height / 3);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}